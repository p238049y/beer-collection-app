enum WorkOutType { strengthTraining, runOrWalk, other }

List<String> workOutTypeList = ['ランニング・ウォーキング', '筋トレ', 'その他'];

String convertToWorkOutName(int workOutType) {
  return workOutTypeList[workOutType];
}
