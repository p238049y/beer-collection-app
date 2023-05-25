import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;

  const ErrorMessage({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        errorMessage, 
        textAlign: TextAlign.left, 
        style: TextStyle(color: Colors.pink[400], fontSize: 12)
      ),
    );
  }
}