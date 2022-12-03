import 'dart:io';

import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BeerRecordDetailPage extends StatefulWidget {
  const BeerRecordDetailPage({Key? key}) : super(key: key);

  @override
  State<BeerRecordDetailPage> createState() => _BeerRecordDetailPageState();
}

class _BeerRecordDetailPageState extends State<BeerRecordDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBackButton(),
      body : Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: Column(
        children: [
          SizedBox(
            width: 350,
            height: 250,
            child: Image.asset('assets/images/tokyo_white.png')
          ),
          const Gap(16),
          const TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'ビール名：東京ホワイト',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder()
            ),
          ),
          const Gap(16),
          const TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'ビアスタイル：セゾン',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder()
            ),
          ),
          const Gap(16),
          const TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'アルコール度数：5.0%',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder()
            ),
          ),
          const Gap(16),
          const TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'カロリー：350kcal',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder()
            ),
          ),
        ],
      ),  
      ),
    );
  }
}