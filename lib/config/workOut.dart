enum WorkOutType { strengthTraining, runOrWalk, other }

List<String> workOutTypeList = ['ランニング・ウォーキング', '筋トレ', 'その他'];

String convertToWorkOutName(int workOutType) {
  if (workOutType < 0 || workOutType >= workOutTypeList.length) {
    return '';
  }
  return workOutTypeList[workOutType];
}
