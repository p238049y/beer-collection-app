import 'dart:io';

import 'package:beer_collection/util/app_styles.dart';
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
      body : Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
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
              child: const Icon(Icons.photo, size: 200,),
            )
            : Image.file(
                File(_image!.path),
                width: 350,
                height: 250
              )
          ),
          const Gap(16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'ビール名',
              labelStyle: TextStyle(
                fontSize: 20,
              ),
              border: OutlineInputBorder()
            ),
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
              border: OutlineInputBorder()
            ),
            onChanged: (String value) {
              // setState(() {
              //   displayData.text = value;
              // });
            },
          ),
        ],
      ),  
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [
          // カメラから取得するボタン
          FloatingActionButton(
            heroTag: 'camera',
            onPressed: getImageFromCamera,
            child: const Icon(Icons.photo_camera)

          ),
          // ギャラリーから取得するボタン
          FloatingActionButton(
            heroTag: 'gallery',
            onPressed: getImageFromGalley,
            child: const Icon(Icons.photo_album)
          ),
          FloatingActionButton(
            heroTag: 'register',
            onPressed: () => {
              Navigator.of(context).pop(),
            },
            child: const Icon(Icons.add_task)
          )
        ]
      )
    );
  }
}
