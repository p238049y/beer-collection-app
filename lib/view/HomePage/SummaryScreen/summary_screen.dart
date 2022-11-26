import 'package:beer_collection/util/app_layout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
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
          // ignore: todo
          // TODO: https://github.com/p238049y/beer-collection-app/issues/8で改修する
          Text(
            '本数: ５本',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
          Text(
            'カロリー: 1200kcal',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
          const Gap(16),
          Text(
            '消費するための運動',
            style:  Styles.headLineStyle1.copyWith(color: Colors.black),
          ),
          const Gap(8),
          Text(
            'ランニング: 120分',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
                    Text(
            'ウォーキング: 240分',
            style:  Styles.headLineStyle2.copyWith(color: Colors.black),
          ),
        ]
      )
    );
  }
}
