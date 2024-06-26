import 'dart:io';
import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/repository/beer/beer.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/beer_style_list.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/util/validator.dart';
import 'package:beer_collection/view/HomePage/BeerRecordAddPage/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class BeerRecordAddPage extends StatefulWidget {
  const BeerRecordAddPage({Key? key}) : super(key: key);

  @override
  State<BeerRecordAddPage> createState() => _BeerRecordAddPageState();
}

class _BeerRecordAddPageState extends State<BeerRecordAddPage> {
  XFile? _image;
  final imagePicker = ImagePicker();
  final TextEditingController _textEditingController = TextEditingController();

  RequestBeer registryBeer = RequestBeer();

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        registryBeer.image = pickedFile.path;
        _image = XFile(pickedFile.path);
      }
    });
  }

  Future getImageFromGalley() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        registryBeer.image = pickedFile.path;
        _image = XFile(pickedFile.path);
      }
    });
  }

  Future<void> initDb() async {
    await DbProvider.setDb();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                Center(
                    child: _image == null
                        ? Container(
                            width: 350,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.photo,
                              size: 200,
                            ),
                          )
                        : Image.file(File(_image!.path),
                            width: 350, height: 250)),
                const Gap(16),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'ビール名',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return inputValidation(value!, 50);
                  },
                  onChanged: (String value) {
                    setState(() {
                      registryBeer.beerName = value;
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
                        value: registryBeer.beerStyle,
                        hint: const Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text('ビアスタイル',
                                style: TextStyle(fontSize: 20.0))),
                        items: beerStyleList
                            .asMap()
                            .entries
                            .map((beer) => DropdownMenuItem(
                                value: beer.key, child: Text(beer.value)))
                            .toList(),
                        onChanged: (int? value) {
                          setState(() {
                            registryBeer.beerStyle = value ?? 0;
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
                  onChanged: (String value) {
                    setState(() {
                      registryBeer.alcoholDegree = double.parse(value);
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
                  onChanged: (String value) {
                    setState(() {
                      registryBeer.calorie = int.parse(value);
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
                    _selectDate(context, registryBeer);
                  },
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                          if (checkInputItem(registryBeer)) {
                            await DbProvider.insertData(registryBeer);
                            Navigator.of(context).pop();
                          }
                        },
                        iconSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  _selectDate(BuildContext context, RequestBeer registryBeer) async {
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
        registryBeer.registryDateTime = dateFormat.format(newSelectedDate);
      });
    }
    _textEditingController.text = dateFormat.format(selectedDate);
  }
}
