import 'dart:io';

import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/BeerRecordDetailPage/beer_record_detail_page.dart';
import 'package:flutter/material.dart';

class BeerListScreen extends StatelessWidget {
  final List<BeerView> beerList;
  const BeerListScreen({Key? key, required this.beerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // NOTE: https://qiita.com/code-cutlass/items/3a8b759056db1e8f7639
        // ListViewやGridViewを入れ子にして、表示やリストのスクロールを可能にするための設定
        itemCount: beerList.length,
        itemBuilder: (BuildContext context, int index) { 
          return Container(
            child: ListTile(
              minLeadingWidth: 120.0,
              leading: Image.file(File(beerList[index].image)),
              title: Text(beerList[index].beerName),
              subtitle: Text(beerList[index].registryDateTime),
              onTap: () {
                Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  BeerRecordDetailPage(beer: beerList[index]),
                        )
                );
              },
            ),
          );
        },
      )
    );
  }
}