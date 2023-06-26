import 'package:beer_collection/entities/workout.dart';
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
  await WorkOutDbProvider.insertUserData(registryWorkOut);
}
