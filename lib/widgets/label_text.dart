import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String labelText;

  const LabelText({Key? key, required this.labelText,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(labelText, textAlign: TextAlign.left),
    );
  }
}