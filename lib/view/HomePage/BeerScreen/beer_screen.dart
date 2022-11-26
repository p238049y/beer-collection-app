import 'package:beer_collection/util/app_layout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class BeerScreen extends StatelessWidget {
  final Map<String, dynamic> beer;
  const BeerScreen({Key? key, required this.beer}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width * 0.6,
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.only(right: 24, top: 8),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/${beer['image']}',
                ),
              ),
            ),
          ),
          const Gap(8),
          Text(
            beer['name'],
            style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
          Text(
            beer['style'],
            style:  Styles.headLineStyle3.copyWith(color: Colors.white),
          ),
          Text(
            '${beer['avb']}%',
            style:  Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
          ),
          Text(
            // ignore: todo
            //TODO:登録した日付を出す(https://github.com/p238049y/beer-collection-app/issues/8)
            '2022/11/20',
            style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
          ),
        ]
      ),
    );
  }
}