import 'package:beer_collection/util/app_info_first.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/view/HomePage/BeerScreen/beer_screen.dart';
import 'package:beer_collection/view/HomePage/SummaryScreen/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'BeerRecordAddPage/beer_record_add_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "最新のビール記録",
                  style: Styles.headLineStyle2,
                ),
                InkWell(
                  onTap: () {
                    print("You are tapped \"View all\"");
                  },
                  child: Text(
                    "View all > ",
                    style:
                        Styles.textStyle.copyWith(color: Styles.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: beerList.map((beer) => BeerScreen(beer: beer)).toList(),
            )
          )
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "今週の飲み記録",
                  style: Styles.headLineStyle2,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HealthPage())
                    );
                  },
                  child: Text(
                    "View detail > ",
                    style:
                        Styles.textStyle.copyWith(color: Styles.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          const Gap(8),
          const SummaryScreen(),  
        ],
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'beerRecordAdd',
            backgroundColor: Colors.blue[500],
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const BeerRecordAddPage())
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
