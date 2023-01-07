import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/entities/user.dart';
import 'package:beer_collection/util/app_layout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/view/HomePage/SummaryScreen/model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SummaryScreen extends StatelessWidget {
  final List<BeerView> beerList;
  final DatePeriod period;
  final UserView userData;
  const SummaryScreen({Key? key, required this.beerList, required this.period, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    final List<BeerView> weeklyBeerList = getWeeklyBeerList(beerList, period);
    final int sumCalorie = getSumCalorie(weeklyBeerList);
    final int walkingTime = calcCaloriesBurnedTime(1, userData.weight, sumCalorie);
    final int runningTime = calcCaloriesBurnedTime(2, userData.weight, sumCalorie);
    return  Container(
      width: size.width * 0.6,
      height: 220,
      margin: const EdgeInsets.only(right: 16, left: 16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[200],
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ]
      ),
      padding: const EdgeInsets.only(left: 16), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[200],
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const Gap(8),
          Text(
            '本数: ${weeklyBeerList.length}本',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
          Text(
            'カロリー: ${sumCalorie}kcal',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
          const Gap(16),
          Text(
            '消費するための運動',
            style:  Styles.headLineStyle1.copyWith(color: Colors.black),
          ),
          const Gap(8),
          Text(
            'ランニング: $runningTime分',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
                    Text(
            'ウォーキング: $walkingTime分',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
        ]
      )
    );
  }
}
