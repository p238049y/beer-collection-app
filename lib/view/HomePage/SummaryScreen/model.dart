import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/util/get_week_date.dart';

List<BeerView> getWeeklyBeerList(List<BeerView> beerList, DatePeriod period) {
  final List<BeerView> weeklyBeerList = [];
  for (var beer in beerList) {
    if (beer.registryDateTime == period.startDate ||
        beer.registryDateTime == period.endDate ||
        (period.startDate.compareTo(beer.registryDateTime) < 0 &&
        period.endDate.compareTo(beer.registryDateTime) > 0)) {
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

int calcCaloriesBurnedTime(int exerciseType, double weight, int calorie) {
  // 成人の体重1kg、1時間あたりの安静時のエネルギー消費量(resting energy expenditure)
  double REE = 1.05;
  double METs = 0.0;

  switch (exerciseType) {
    case 1:
      METs = 4.3; 
      break;
    case 2:
      METs = 8.3;
      break;
    default:
      break;
  }
  
  double burnedCaloriesTime = calorie / (METs * weight * REE) * 60;

  if (burnedCaloriesTime.isNaN || burnedCaloriesTime.isInfinite) {
    return 0;
  } else {
    int parseIntTime = burnedCaloriesTime.toInt();
    return parseIntTime;
  }
}
