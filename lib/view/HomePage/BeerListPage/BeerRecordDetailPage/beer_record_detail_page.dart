import 'package:flutter/material.dart';

class BeerRecordDetailPage extends StatefulWidget {
  const BeerRecordDetailPage({Key? key}) : super(key: key);

  @override
  State<BeerRecordDetailPage> createState() => _BeerRecordDetailPageState();
}

class _BeerRecordDetailPageState extends State<BeerRecordDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: TextButton(
          child: Text("最初のページに戻る"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}