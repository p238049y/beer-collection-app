import 'dart:io';

import 'package:beer_collection/util/beer_style_list.dart';
import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';

class BeerRecordAddPage extends StatefulWidget {
  const BeerRecordAddPage({Key? key}) : super(key: key);

  @override
  State<BeerRecordAddPage> createState() => _BeerRecordAddPageState();
}

class _BeerRecordAddPageState extends State<BeerRecordAddPage> {
  XFile? _image;
  final imagePicker = ImagePicker();
  DateTime? _selectedDate;
  final TextEditingController _textEditingController = TextEditingController();

  Future getImageFromCamera() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      }
    });
  }

  Future getImageFromGalley() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBackButton(),
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
                  onChanged: (String value) {
                    // setState(() {
                    //   TODO: 保存のための値をセットする;
                    // });
                  },
                ),
                const Gap(16),
                BsSelectBox(
                  hintText: 'スタイル',
                  controller: beerStyleList,
                ),
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
                    // setState(() {
                    //   TODO: 保存のための値をセットする;
                    // });
                  },
                ),
                const Gap(16),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'カロリー',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  onChanged: (String value) {
                    // setState(() {
                    //   displayData.text = value;
                    // });
                  },
                ),
                const Gap(24),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: '日付',
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder()),
                  controller: _textEditingController,
                  onTap: () {
                    _selectDate(context);
                  },
                  onChanged: (String value) {
                    // setState(() {
                    //   displayData.text = value;
                    // });
                  },
                ),
                const Gap(24),
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
                        onPressed: () => {
                        Navigator.of(context).pop(),
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

  _selectDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController.text = _selectedDate.toString();
    }
  }
}
