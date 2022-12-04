import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:beer_collection/widgets/list_item_widget.dart';
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
          const ListItem(isEnabled: false, title: 'ビール名', name: '東京ホワイト'),
          const Gap(16),
          const ListItem(isEnabled: false, title: 'ビアスタイル', name: 'セゾン'),
          const Gap(16),
          const ListItem(isEnabled: false, title: 'アルコール度数', name: '5.0', unit: '%'),
          const Gap(16),
          const ListItem(isEnabled: false, title: 'カロリー', name: '350', unit: 'kcal'),
        ],
      ),  
      ),
    );
  }
}