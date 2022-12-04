import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String name;
  final bool isEnabled;
  final String unit;

  const ListItem({Key? key, required this.isEnabled, required this.title, required this.name, this.unit = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      TextField(
        enabled: isEnabled,
        decoration: InputDecoration(
          labelText: '$title：$name $unit',
          labelStyle: const TextStyle(
            fontSize: 20,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
          border: const OutlineInputBorder()
        ),
      );
  }
}