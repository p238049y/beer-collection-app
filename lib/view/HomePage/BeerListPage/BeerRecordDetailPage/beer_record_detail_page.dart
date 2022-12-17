import 'dart:io';

import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/util/beer_style_list.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:beer_collection/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BeerRecordDetailPage extends StatelessWidget {
  final BeerView beer;
  const BeerRecordDetailPage({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBackButton(),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: Column(
          children: [
            SizedBox(
                width: 350,
                height: 250,
                child: Image.file(File(beer.image))),
            const Gap(16),
            ListItem(isEnabled: false, title: 'ビール名', name: beer.beerName),
            const Gap(16),
            ListItem(isEnabled: false, title: 'ビアスタイル', name: convertBeerStyleName(beer.beerStyle)),
            const Gap(16),
            ListItem(
                isEnabled: false, title: 'アルコール度数', name: beer.alcoholDegree.toString(), unit: '%'),
            const Gap(16),
            ListItem(
                isEnabled: false, title: 'カロリー', name: beer.calorie.toString(), unit: 'kcal'),
          ],
        ),
      ),
    );
  }
}
