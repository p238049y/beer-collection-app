import 'package:beer_collection/util/app_info_first.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/BeerListScreen/beer_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BeerListPage extends StatefulWidget {
  const BeerListPage({Key? key}) : super(key: key);

  @override
  State<BeerListPage> createState() => _BeerListPageState();
}

class _BeerListPageState extends State<BeerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        leading:  TextButton(
          child: Text(
          '< back',
          style: TextStyle(
            color: Styles.primaryColor,
            fontWeight: FontWeight.bold, 
            fontSize: 15.0
          ),  
        ),
        onPressed: () => Navigator.of(context).pop(),
        )
      ),
      body : BeerListScreen(beerList: beerList),
    );
  }
}
