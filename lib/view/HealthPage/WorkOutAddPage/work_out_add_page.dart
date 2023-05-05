
import 'package:flutter/material.dart';

class WorkOutAddPage extends StatelessWidget {
  const WorkOutAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: TextButton(
          child: const Text("前のページに戻る"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      )
    );
  }
}