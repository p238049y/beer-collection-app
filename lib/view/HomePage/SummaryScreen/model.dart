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

// 成人の体重1kg、1時間あたりの安静時のエネルギー消費量(resting energy expenditure)
double REE = 1.05;

int calcCaloriesBurned(int exerciseType, double weight, double calorie) {
  double burnedCalories = calorie / (8.3 * weight * REE) * 60;
  int parseIntCalories = burnedCalories.toInt();
  return parseIntCalories;
}