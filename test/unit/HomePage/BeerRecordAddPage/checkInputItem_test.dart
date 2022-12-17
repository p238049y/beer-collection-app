import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/view/HomePage/BeerRecordAddPage/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('必須項目が入力されているかをチェックするためのメソッドであるcheckInputItemのテスト', () {
      RequestBeer inputData = RequestBeer();
      inputData.beerName = '東京ホワイト';
      inputData.beerStyle = 1;
      inputData.alcoholDegree = 5.0;
      inputData.calorie = 350;
      inputData.registryDateTime = '2022/12/13';
      inputData.image = 'assets/images/tokyo_white.png';

    group('すべての項目が入力されている場合、trueが返ること', () {
      test('すべての項目が入力されている場合、trueが返ること', () {
        expect(checkInputItem(inputData), true);
      });
    });

    group('未入力の項目が1つでもある場合にはfalseが返ること', () {
      test('ビール名が空欄の場合、falseが返ること', () {
        inputData.beerName = '';
        expect(checkInputItem(inputData), false);
      });

      test('ビアスタイルが空欄の場合、falseが返ること', () {
        inputData.beerStyle = null;
        expect(checkInputItem(inputData), false);
      });

      test('アルコール度数が空欄の場合、falseが返ること', () {
        inputData.alcoholDegree = 0.0;
        expect(checkInputItem(inputData), false);
      });

      test('カロリーが空欄の場合、falseが返ること', () {
        inputData.calorie = 0;
        expect(checkInputItem(inputData), false);
      });

      test('日付が空欄の場合、falseが返ること', () {
        inputData.registryDateTime = '';
        expect(checkInputItem(inputData), false);
      });

      test('画像が未選択の場合、falseが返ること', () {
        inputData.image = '';
        expect(checkInputItem(inputData), false);
      });
    });

    group('すべての項目が未入力の場合、falseが返ること', () {
      test('すべての項目が未入力の場合、falseが返ること', () {
      inputData.beerName = '';
      inputData.beerStyle = 0;
      inputData.alcoholDegree = 0.0;
      inputData.calorie = 0;
      inputData.registryDateTime = '';
      inputData.image = '';
        expect(checkInputItem(inputData), false);
      });
    });
  });
}