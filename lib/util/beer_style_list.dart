class BeerStyle {
  late int id;
  late String styleName;
}

List<String> beerStyleList = ["IPA", "セゾン", "スタウト", "ピルスナー", "ヘイジーIPA"];

String convertBeerStyleName(int index) {
  return beerStyleList[index];
}