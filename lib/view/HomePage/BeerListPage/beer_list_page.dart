import 'package:beer_collection/util/app_info_first.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/BeerListScreen/beer_list_screen.dart';
import 'package:beer_collection/widgets/common_back_button_widget.dart';
import 'package:flutter/material.dart';

class BeerListPage extends StatefulWidget {
  const BeerListPage({Key? key}) : super(key: key);

  @override
  State<BeerListPage> createState() => _BeerListPageState();
}

class _BeerListPageState extends State<BeerListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonBackButton(),
      body : BeerListScreen(beerList: beerList),
    );
  }
}
