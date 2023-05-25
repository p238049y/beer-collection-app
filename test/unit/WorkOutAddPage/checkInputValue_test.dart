import 'package:beer_collection/entities/workout.dart';
import 'package:beer_collection/view/HealthPage/WorkOutAddPage/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('必須項目が入力されているかをチェックするためのメソッドであるcheckInputValueのテスト', () {
      RequestWorkOutValidate requestWorkOutValidate = RequestWorkOutValidate();
      RequestWorkOut inputData = RequestWorkOut();
      inputData.workOutType = 0;
      inputData.registryDate = '2022/12/13';
      inputData.load = 12.3;
      inputData.frequency = 10;
      inputData.time = 234;
      inputData.distance = 9.5;

    group('すべての項目が入力されている場合、falseが返ること', () {
      test('すべての項目が入力されている場合、falseが返ること', () {
        int currentWorkOutType = inputData.workOutType ?? -1;
        requestWorkOutValidate.checkInputValue(inputData);
        expect(requestWorkOutValidate.isInValidData(currentWorkOutType), false);
      });
    });

    group('workOutTypeが0(ランニング・ウォーキング)の場合', () {
      int currentWorkOutType = 0;
      group('テスト未入力の項目が1つでもある場合にはtrueが返ること', () {
         test('日付が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.load = 12.3;
          inputData.frequency = 10;
          inputData.time = 234;
          inputData.distance = 9.5;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });

         test('時間が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.registryDate = '2022/12/13';
          inputData.load = 12.3;
          inputData.frequency = 10;
          inputData.distance = 9.5;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });

         test('距離が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.registryDate = '2022/12/13';
          inputData.load = 12.3;
          inputData.frequency = 10;
          inputData.time = 234;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });
      });
    });

    group('workOutTypeが1(筋トレ)の場合', () {
      int currentWorkOutType = 1;
      group('テスト未入力の項目が1つでもある場合にはtrueが返ること', () {
        test('日付が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.load = 12.3;
          inputData.frequency = 10;
          inputData.time = 234;
          inputData.distance = 9.5;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });

         test('重量が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.registryDate = '2022/12/13';
          inputData.frequency = 10;
          inputData.time = 234;
          inputData.distance = 9.5;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });

         test('回数が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.registryDate = '2022/12/13';
          inputData.load = 12.3;
          inputData.time = 234;
          inputData.distance = 9.5;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });
      });
    });

    group('workOutTypeが2(その他)の場合', () {
      int currentWorkOutType = 2;
      group('テスト未入力の項目が1つでもある場合にはtrueが返ること', () {
        test('日付が空欄の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          inputData.load = 12.3;
          inputData.frequency = 10;
          inputData.time = 234;
          inputData.distance = 9.5;
          requestWorkOutValidate.checkInputValue(inputData);
          expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
        });
      });
    });

    group('すべての項目が未入力の場合、trueが返ること', () {
      int currentWorkOutType = -1;
      test('すべての項目が未入力の場合、trueが返ること', () {
          RequestWorkOut inputData = RequestWorkOut();
          inputData.workOutType = currentWorkOutType;
          requestWorkOutValidate.checkInputValue(inputData);
        expect(requestWorkOutValidate.isInValidData(currentWorkOutType), true);
      });
    });
  });
}