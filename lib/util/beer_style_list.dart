class BeerStyle {
  late int id;
  late String styleName;
}

List<String> beerStyleList = ["IPA", "セゾン", "スタウト", "ピルスナー", "ヘイジーIPA", "その他"];

String convertBeerStyleName(int index) {
  return beerStyleList[index];
}