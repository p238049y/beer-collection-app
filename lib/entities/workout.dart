class WorkOutView {
  int id = -1;
  int workOutType = -1;
  String registryDate = '';
  int calorie = 0;

  WorkOutView(this.id, this.workOutType, this.registryDate, this.calorie);
}

class RequestWorkOut {
  int? workOutType;
  String registryDate;
  int calorie;
  double? load;
  int? frequency;
  int? time;
  double? distance;

  RequestWorkOut(
      {this.workOutType,
      this.calorie = 0,
      this.registryDate = '',
      this.load = 0.0,
      this.frequency = -1,
      this.time = -1,
      this.distance = 0.0
      });
}