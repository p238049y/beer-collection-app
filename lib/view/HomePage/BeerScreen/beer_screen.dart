import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/util/app_layout.dart';
import 'package:beer_collection/util/app_styles.dart';
import 'package:beer_collection/util/beer_style_list.dart';
import 'package:beer_collection/view/HomePage/BeerListPage/BeerRecordDetailPage/beer_record_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BeerScreen extends StatelessWidget {
  final BeerView beer;
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
      child: GestureDetector(
        onTap: () {
          Navigator
          .of(context)
          .push(
              MaterialPageRoute(
                  builder: (context) =>
                      BeerRecordDetailPage(beerId: beer.id),
              )
          );
        },
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
                    beer.image,
                  ),
                ),
              ),
            ),
            const Gap(8),
            Text(
              beer.beerName,
              style:  Styles.headLineStyle1.copyWith(color: Styles.kakiColor),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              convertBeerStyleName(beer.beerStyle),
              style:  Styles.headLineStyle3.copyWith(color: Colors.white),
            ),
            Text(
              '${beer.alcoholDegree}%',
              style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
            ),
            Text(
              beer.registryDateTime,
              style:  Styles.headLineStyle2.copyWith(color: Styles.kakiColor),
            ),
          ]
        ),
      )
    );
  }
}