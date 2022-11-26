import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);
  
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