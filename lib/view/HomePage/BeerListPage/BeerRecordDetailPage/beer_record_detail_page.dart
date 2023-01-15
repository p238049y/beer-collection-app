import 'dart:io';
import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/repository/beer/beer.dart';
import 'package:beer_collection/util/beer_style_list.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/BeerRecordEditPage/beer_record_edit_page.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:beer_collection/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BeerRecordDetailPage extends StatefulWidget {
  final int beerId;
  const BeerRecordDetailPage({Key? key, required this.beerId})
      : super(key: key);

  @override
  State<BeerRecordDetailPage> createState() => _BeerRecordDetailPageState();
}

class _BeerRecordDetailPageState extends State<BeerRecordDetailPage> {
  BeerView beerData = BeerView(0, '', 0, 0, 0, '', '');
  Future<void> initDb() async {
    await DbProvider.setDb();
    beerData = await DbProvider.getBeerData(widget.beerId);
    setState(() {});
  }

  Future<void> reBuild() async {
    await DbProvider.setDb();
    beerData = await DbProvider.getBeerData(widget.beerId);
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
          actions: [
            // const CommonBackButton(),
            IconButton(
              icon: const Icon(Icons.create),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        BeerRecordEditPage(beerData: beerData)));
              },
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.blueGrey),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
            future: reBuild(),
            builder: (context, snapshot) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 350,
                          height: 250,
                          child: Image.file(File(beerData.image))),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: 'ビール名',
                          name: beerData.beerName),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: 'ビアスタイル',
                          name: convertBeerStyleName(beerData.beerStyle)),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: 'アルコール度数',
                          name: beerData.alcoholDegree.toString(),
                          unit: '%'),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: 'カロリー',
                          name: beerData.calorie.toString(),
                          unit: 'kcal'),
                      const Gap(16),
                      ListItem(
                          isEnabled: false,
                          title: '日付',
                          name: beerData.registryDateTime),
                    ],
                  ),
                ),
              );
            }));
  }
}
