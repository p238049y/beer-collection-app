import 'package:beer_collection/entities/beer.dart';
import 'package:beer_collection/util/get_week_date.dart';
import 'package:beer_collection/view/HomePage/SummaryScreen/model.dart';
import 'package:flutter_test/flutter_test.dart';

List<BeerView> getDummyBeerList() {
  List<BeerView> dummyBeerList = [];

  BeerView beer_1 = BeerView(1, '東京ホワイト', 2, 5.0, 350, 'tokyo_white.png' ,'2022/12/25');
  BeerView beer_2 = BeerView(2, '馨和', 5, 9.0, 400, 'kagua.png' ,'2022/12/26');
  BeerView beer_3 = BeerView(3, 'ビアへるん', 3, 5.5, 360, 'beer_herun_stout.png' ,'2022/12/14');
  BeerView beer_4 = BeerView(4, '天空IPA', 1, 5.0, 388, 'yonayona_ale.png' ,'2022/12/17');
  BeerView beer_5 = BeerView(5, 'よなよなエール', 1, 5.0, 390, 'yonayona_ale.png' ,'2022/12/09');

  dummyBeerList.addAll([beer_1, beer_2, beer_3, beer_4, beer_5]);

  return dummyBeerList;
}

void main() {
  group('引数により与えられた期間のビール記録を取得するためメソッドであるgetWeeklyBeerListのテスト', (){
    List<BeerView> dummyBeerList = getDummyBeerList();
    group('期間の始まりか終わりの日付がデータの日付と被っている場合にそのデータが返ってくることを確かめるためのテスト', () {
      test('期間が2022/12/09から2022/12/16の場合長2のリストが返ってくること', () {
        final DatePeriod period = DatePeriod('2022/12/09', '2022/12/16');
        final List<BeerView> weeklyBeerList = getWeeklyBeerList(dummyBeerList, period);
        expect(weeklyBeerList.length, 2);
      });

      test('期間が2022/12/04から2022/12/09の場合長1のリストが返ってくること', () {
        final DatePeriod period = DatePeriod('2022/12/04', '2022/12/09');
        final List<BeerView> weeklyBeerList = getWeeklyBeerList(dummyBeerList, period);
        expect(weeklyBeerList.length, 1);
      });
    });

    group('期間内にデータの日付がおさまっている場合そのデータが返ってくることを確かめるためのテスト', () {
      test('期間が2022/12/10から2022/12/18の場合長1のリストが返ってくること', () {
        final DatePeriod period = DatePeriod('2022/12/10', '2022/12/18');
        final List<BeerView> weeklyBeerList = getWeeklyBeerList(dummyBeerList, period);
        expect(weeklyBeerList.length, 2);
      });
    });

    group('期間内にデータの日付がおさまっていない場合何もデータが返ってこないことを確かめるためのテスト', () {
      test('期間が2022/11/10から2022/11/18の場合長0のリストが返ってくること', () {
        final DatePeriod period = DatePeriod('2022/11/10', '2022/11/18');
        final List<BeerView> weeklyBeerList = getWeeklyBeerList(dummyBeerList, period);
        expect(weeklyBeerList.length, 0);
      });
    });
  }); 
}