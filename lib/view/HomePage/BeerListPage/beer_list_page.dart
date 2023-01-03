import 'dart:io';

import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/repository/beer/beer.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/BeerRecordDetailPage/beer_record_detail_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:flutter/material.dart';

class BeerListPage extends StatefulWidget {
  const BeerListPage({Key? key}) : super(key: key);

  @override
  State<BeerListPage> createState() => _BeerListPageState();
}

class _BeerListPageState extends State<BeerListPage> {
  List<BeerView> beerList = [];

  Future<void> initDb() async {
    await DbProvider.setDb();
    beerList = await DbProvider.getBeerList();
    setState(() {});
  }

  Future<void> reBuild() async {
    beerList = await DbProvider.getBeerList();
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
      appBar: const CommonBackButton(),
      body :Scaffold(
        body: ListView.builder(
      // NOTE: https://qiita.com/code-cutlass/items/3a8b759056db1e8f7639
      // ListViewやGridViewを入れ子にして、表示やリストのスクロールを可能にするための設定
      itemCount: beerList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (value) async {
                        await DbProvider.deleteData(beerList[index].id);
                        reBuild();
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: '削除',
                    ),
                  ],
                ),
                child: ListTile(
                  minLeadingWidth: 120.0,
                  leading: Image.file(File(beerList[index].image)),
                  title: Text(beerList[index].beerName),
                  subtitle: Text(beerList[index].registryDateTime),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          BeerRecordDetailPage(beer: beerList[index]),
                    ));
                  },
                )));
      },
    ))
    );
  }
}
