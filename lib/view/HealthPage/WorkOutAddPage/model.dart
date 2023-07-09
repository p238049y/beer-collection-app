import 'package:beer_collection/entities/user.dart';
import 'package:beer_collection/entities/workout.dart';
import 'package:beer_collection/repository/user/user.dart';
import 'package:beer_collection/repository/workout/workout.dart';

class RequestWorkOutValidate {
  bool isInValidWorkOutType = false;
  bool isInValidRegistryDate = false;
  bool isInValidCalorie = false;
  bool isInValidLoad = false;
  bool isInValidFrequency = false;
  bool isInValidTime = false;
  bool isInValidDistance = false;

  void checkInputValue(RequestWorkOut registryWorkOut) {
    isInValidWorkOutType = (registryWorkOut.workOutType == null ||
        registryWorkOut.workOutType == -1);

    isInValidRegistryDate = registryWorkOut.registryDate.isEmpty;
    isInValidLoad =
        (registryWorkOut.load == null || registryWorkOut.load == 0.0);
    isInValidFrequency =
        (registryWorkOut.frequency == null || registryWorkOut.frequency == -1);
    isInValidTime =
        (registryWorkOut.time == null || registryWorkOut.time == -1);
    isInValidDistance =
        (registryWorkOut.distance == null || registryWorkOut.distance == 0.0);
    isInValidCalorie = (registryWorkOut.calorie < 1);
  }

  bool isInValidData(int workOutType) {
    switch (workOutType) {
      case 0:
        return (isInValidWorkOutType ||
            isInValidRegistryDate ||
            isInValidTime ||
            isInValidDistance);
      case 1:
        return (isInValidWorkOutType ||
            isInValidRegistryDate ||
            isInValidLoad ||
            isInValidFrequency);
      case 2:
        return (isInValidWorkOutType || isInValidRegistryDate);
      default:
        return true;
    }
  }
}

void registerWorkOut(RequestWorkOut registryWorkOut) async {
  // データ登録の処理
  double burnedCalorie = 0.0;

  if (registryWorkOut.workOutType == 0) {
    int elapsedTime = registryWorkOut.time ?? 0;
    double runningDistance = registryWorkOut.distance ?? 0.0;
    burnedCalorie =
        await _calcCaloriesBurnedByRunning(elapsedTime, runningDistance);
    registryWorkOut.calorie = burnedCalorie;
  } else if (registryWorkOut.workOutType == 1) {
    burnedCalorie = await _calcCaloriesBurnedByWeightTraining();
    registryWorkOut.calorie = burnedCalorie;
  } else {
    registryWorkOut.calorie = 0.0;
  }

  await WorkOutDbProvider.insertUserData(registryWorkOut);
}

Future<double> _calcCaloriesBurnedByRunning(int time, double distance) async {
  UserView userDate = await UserDbProvider.getUserData();
  double hour = time / (60 * 60);
  double speed = distance / hour;
  double METS = 0.9486 * speed + 0.0931;
  double calories = userDate.weight * hour * METS * 1.05;

  return calories;
}

Future<double> _calcCaloriesBurnedByWeightTraining() async {
  UserView userDate = await UserDbProvider.getUserData();
  double calories = userDate.weight * 0.05 * 6.0 * 1.05;
  return calories;
}
