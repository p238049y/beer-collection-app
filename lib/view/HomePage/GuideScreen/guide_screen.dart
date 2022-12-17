import 'package:beer_collection/util/app_layout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);
  
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
                image: const DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/beerExample.png',
                  ),
                )
              ),
            ),
            const Gap(8),
            Text(
              'ビール名',
              style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
            ),
            Text(
              'ビアスタイル',
              style:  Styles.headLineStyle2.copyWith(color: Colors.white),
            ),
            Text(
              'アルコール度数',
              style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
            ),
            Text(
              '日付が表示されます',
              style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
            ),
          ]
        ),
      );
  }
}