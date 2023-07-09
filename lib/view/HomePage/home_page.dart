import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/entities/user.dart';
import 'package:beer_collection/repository/beer/beer.dart';
import 'package:beer_collection/repository/user/user.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/beer_list_page.dart';
import 'package:beer_collection/view/HomePage/BeerScreen/beer_screen.dart';
import 'package:beer_collection/view/HomePage/GuideScreen/guide_screen.dart';
import 'package:beer_collection/view/HomePage/SummaryScreen/model.dart';
import 'package:beer_collection/view/HomePage/SummaryScreen/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'BeerRecordAddPage/beer_record_add_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BeerView> beerList = [];
  DatePeriod period = getWeekDate();

  List<BeerView> weeklyBeerList = [];
  int sumCalorie = 0;
  int walkingTime = 0;
  int runningTime = 0;

  UserView userData = UserView(0, '未登録', 0, 0);

  Future<void> initDb() async {
    await DbProvider.setDb();
    beerList = await DbProvider.getBeerList();

    if (beerList.isNotEmpty) {
      weeklyBeerList = getWeeklyBeerList(beerList, period);
    }

    await UserDbProvider.setDb();
    userData = await UserDbProvider.getUserData();
    sumCalorie = getSumCalorie(weeklyBeerList);
    walkingTime = calcCaloriesBurnedTime(1, userData.weight, sumCalorie);
    runningTime = calcCaloriesBurnedTime(2, userData.weight, sumCalorie);

    setState(() {});
  }

  Future<void> reBuild() async {
    beerList = await DbProvider.getBeerList();
    weeklyBeerList = getWeeklyBeerList(beerList, period);
    sumCalorie = getSumCalorie(weeklyBeerList);
    walkingTime = calcCaloriesBurnedTime(1, userData.weight, sumCalorie);
    runningTime = calcCaloriesBurnedTime(2, userData.weight, sumCalorie);
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
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: reBuild(),
          builder: (context, snapshot) {
            return Scaffold(
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
                        Visibility(
                          visible: beerList.isNotEmpty,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BeerListPage()));
                            },
                            child: Text(
                              "View all > ",
                              style: Styles.textStyle
                                  .copyWith(color: Styles.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 20),
                      child: beerList.isEmpty
                          ? const GuideScreen()
                          : Row(
                              children: beerList
                                  .map((beer) => BeerScreen(beer: beer))
                                  .toList(),
                            )),
                  const Gap(15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${period.startDate} ~ ${period.endDate}の記録',
                          style: Styles.headLineStyle2,
                        ),
                        // TODO: v1.1以降で実装
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => const HealthPage()));
                        //   },
                        //   child: Text(
                        //     "View detail > ",
                        //     style: Styles.textStyle
                        //         .copyWith(color: Styles.primaryColor),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  SummaryScreen(
                      weeklyBeerList: weeklyBeerList,
                      sumCalorie: sumCalorie,
                      walkingTime: walkingTime,
                      runningTime: runningTime),
                ],
              ),
            );
          }),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'beerRecordAdd',
            backgroundColor: Colors.blue[500],
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BeerRecordAddPage()));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
