import 'package:flutter/material.dart';

class BeerRecordAddPage extends StatelessWidget {
  const BeerRecordAddPage({Key? key}) : super(key: key);
  
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