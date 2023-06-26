import 'package:beer_collection/entities/workout.dart';

class RequestWorkOutValidate {
  bool isInValidWorkOutType = false;
  bool isInValidRegistryDate = false;
  bool isInValidCalorie = false;
  bool isInValidLoad = false;
  bool isInValidFrequency = false;
  bool isInValidTime = false;
  bool isInValidDistance = false;

  void checkInputValue(RequestWorkOut registryWorkOut) {
    if (registryWorkOut.workOutType == null || registryWorkOut.workOutType == -1) {
      isInValidWorkOutType = true;
    } else {
      isInValidWorkOutType = false;
    }

    if (registryWorkOut.registryDate.isEmpty) {
      isInValidRegistryDate = true;
    } else {
      isInValidRegistryDate = false;
    }

    if (registryWorkOut.load == null || registryWorkOut.load == 0.0) {
      isInValidLoad = true;
    } else {
      isInValidLoad = false;
    }

    if (registryWorkOut.frequency == null || registryWorkOut.frequency == -1) {
      isInValidFrequency = true;
    } else {
      isInValidFrequency = false;
    }

    if (registryWorkOut.time == null || registryWorkOut.time == -1) {
      isInValidTime = true;
    } else {
      isInValidTime = false;
    }

    if (registryWorkOut.distance == null || registryWorkOut.distance == 0.0) {
      isInValidDistance = true;
    } else {
      isInValidDistance = false;
    }

    if (registryWorkOut.calorie < 1) {
      isInValidCalorie = true;
    } else {
      isInValidCalorie = false;
    }
  }

  bool isInValidData(int workOutType) {
    switch(workOutType) {
      case 0:
        return (
          isInValidWorkOutType ||
          isInValidRegistryDate ||
          isInValidTime ||
          isInValidDistance
        );
      case 1:
        return (
          isInValidWorkOutType ||
          isInValidRegistryDate ||
          isInValidLoad ||
          isInValidFrequency
        );
      case 2:
        return (
          isInValidWorkOutType ||
          isInValidRegistryDate
        );
      default:
        return true;
    }
  }
}

void registerWorkOut(RequestWorkOut registryWorkOut) async {
  // データ登録の処理
  await WorkOutDbProvider.insertUserData(registryWorkOut);
}
