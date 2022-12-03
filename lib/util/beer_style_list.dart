import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:flutter/material.dart';

BsSelectBoxController beerStyleList = BsSelectBoxController(
  options: [
    const BsSelectBoxOption(value: 0, text: Text('')),
    const BsSelectBoxOption(value: 1, text: Text('IPA')),
    const BsSelectBoxOption(value: 2, text: Text('セゾン')),
    const BsSelectBoxOption(value: 3, text: Text('スタウト')),
    const BsSelectBoxOption(value: 3, text: Text('ピルスナー')),
    const BsSelectBoxOption(value: 3, text: Text('ヘイジーIPA')),
  ]
);