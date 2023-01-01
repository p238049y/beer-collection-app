import 'package:beer_collection/util/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String emptyCharacter = '';
  String halfWidthSpace = ' ';
  String fullWidthSpace = '　';
  String inputMessage_255 =
      'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅう';
  String inputMessage_256 =
      'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうあ';
  String inputMessage_257 =
      'ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひびぴふぶぷへべぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをんぁあぃいぅうああ';
  int characterLimit_30 = 30;
  int characterLimit_256 = 256;

  group('inputValidationメソッドで文字が入力されない場合のテスト', () {
    test('文字を何も入力しない場合、「こちらは必須項目です。」というメッセージが返ること', () {
      expect(
          inputValidation(emptyCharacter, characterLimit_256), 'こちらは必須項目です。');
    });
  });

  group('inputValidationメソッドで空文字が入力された場合のテスト', () {
    test('入力する文字が半角スペースのみの場合、「空文字は受け付けていません。」というメッセージが返ること', () {
      expect(inputValidation(halfWidthSpace, characterLimit_256),
          '空文字は受け付けていません。');
    });

    test('入力する文字が全角スペースのみの場合、「空文字は受け付けていません。」というメッセージが返ること', () {
      expect(inputValidation(fullWidthSpace, characterLimit_256),
          '空文字は受け付けていません。');
    });
  });

  group('inputValidationメソッドで文字が入力された場合のテスト', () {
    test('入力する文字数が255文字の場合、何もメッセージが返らないこと', () {
      expect(inputValidation(inputMessage_255, characterLimit_256), null);
    });

    test('入力する文字数が256文字の場合、何もメッセージが返らないこと', () {
      expect(inputValidation(inputMessage_256, characterLimit_256),
          null);
    });

    test('入力する文字数が257文字の場合、「256文字以下にしてください。」というメッセージが返ること', () {
      expect(inputValidation(inputMessage_257, characterLimit_256),
          '256文字以下にしてください。');
    });
  });
}
