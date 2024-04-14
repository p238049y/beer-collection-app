import 'dart:io';

import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/repository/beer/beer.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/beer_style_list.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/util/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class BeerRecordEditPage extends StatefulWidget {
  final BeerView beerData;
  const BeerRecordEditPage({Key? key, required this.beerData})
      : super(key: key);

  @override
  State<BeerRecordEditPage> createState() => _BeerRecordEditPageState();
}

class _BeerRecordEditPageState extends State<BeerRecordEditPage> {
  final imagePicker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();

  Future<void> initDb() async {
    await DbProvider.setDb();
    setState(() {});
  }

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        widget.beerData.image = pickedFile.path;
      }
    });
  }

  Future getImageFromGalley() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.beerData.image = pickedFile.path;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = widget.beerData.registryDateTime;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        iconTheme: IconThemeData(color: Styles.primaryColor),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light, // for iOS
          statusBarIconBrightness: Brightness.dark, // for Android
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
                child: Image.file(File(widget.beerData.image),
                    width: 350, height: 250)),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'ビール名',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder()),
              initialValue: widget.beerData.beerName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return inputValidation(value!, 50);
              },
              onChanged: (String value) {
                setState(() {
                  widget.beerData.beerName = value;
                });
              },
            ),
            const Gap(16),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                width: double.infinity,
                height: 60.0,
                child: DropdownButtonHideUnderline(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    value: widget.beerData.beerStyle,
                    hint: const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child:
                            Text('ビアスタイル', style: TextStyle(fontSize: 20.0))),
                    items: beerStyleList
                        .asMap()
                        .entries
                        .map((beer) => DropdownMenuItem(
                            value: beer.key, child: Text(beer.value)))
                        .toList(),
                    onChanged: (int? value) {
                      setState(() {
                        widget.beerData.beerStyle = value ?? 0;
                      });
                    },
                  ),
                ))),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'アルコール度数',
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
                border: OutlineInputBorder(),
              ),
              initialValue: widget.beerData.alcoholDegree.toString(),
              onChanged: (String value) {
                setState(() {
                  widget.beerData.alcoholDegree = double.parse(value);
                });
              },
            ),
            const Gap(16),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  labelText: 'カロリー',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder()),
              initialValue: widget.beerData.calorie.toString(),
              onChanged: (String value) {
                setState(() {
                  widget.beerData.calorie = int.parse(value);
                });
              },
            ),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: '日付',
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder()),
              controller: _textEditingController,
              onTap: () {
                _selectDate(context, widget.beerData);
              },
            ),
            const Gap(16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Ink(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: getImageFromCamera,
                  iconSize: 32.0,
                  color: Colors.white,
                ),
              ),
              Ink(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: const Icon(Icons.photo_album),
                  onPressed: getImageFromGalley,
                  iconSize: 32.0,
                  color: Colors.white,
                ),
              ),
              Ink(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: const Icon(Icons.add_task),
                  onPressed: () async {
                    await DbProvider.updateBeerData(widget.beerData);
                    Navigator.of(context).pop();
                  },
                  iconSize: 32.0,
                  color: Colors.white,
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  _selectDate(BuildContext context, BeerView beerData) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      locale: const Locale('ja'),
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null && newSelectedDate != selectedDate) {
      setState(() {
        selectedDate = newSelectedDate;
        beerData.registryDateTime = dateFormat.format(newSelectedDate);
      });
    }
    _textEditingController.text = dateFormat.format(selectedDate);
  }
}
