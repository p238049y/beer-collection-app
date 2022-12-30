import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:intl/intl.dart';

List<BeerView> getWeeklyBeerList(List<BeerView> beerList, DatePeriod period) {
  final List<BeerView> weeklyBeerList = [];
  for (var beer in beerList) {
    DateTime registryDateTime =
        DateFormat('yyyy/MM/dd').parse(beer.registryDateTime);
    if (registryDateTime.isAtSameMomentAs(period.startDate) ||
        registryDateTime.isAtSameMomentAs(period.endDate) ||
        (registryDateTime.isAfter(period.startDate) &&
        registryDateTime.isBefore(period.endDate))) {
      weeklyBeerList.add(beer);
    }
  }

  return weeklyBeerList;
}

int getSumCalorie(List<BeerView> beerList) {
  int sumCalorie = 0;
  for (var beer in beerList) {
    sumCalorie += beer.calorie;
  }

  return sumCalorie;
}
