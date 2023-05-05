import 'package:flutter/material.dart';

List<Map<String, dynamic>> healthList = [
  {
    'id': 1,
    'workOutType': 1,
    'registryDate': '2023-04-22',
    'calorie': 200,
  },
  {
    'id': 2,
    'workOutType': 2,
    'registryDate': '2023-04-23',
    'calorie': 120,
  },
  {
    'id': 3,
    'workOutType': 3,
    'registryDate': '2023-04-26',
    'calorie': 120,
  },
  {
    'id': 4,
    'workOutType': 2,
    'registryDate': '2023-04-26',
    'calorie': 150,
  },
  {
    'id': 5,
    'workOutType': 1,
    'registryDate': '2023-04-26',
    'calorie': 150,
  },
  {
    'id': 6,
    'workOutType': 1,
    'registryDate': '2023-04-26',
    'calorie': 96,
  }
];

Icon convertTypeToIcon(int workOutType) {
  switch(workOutType) {
    case 1:
      return const Icon(Icons.sports, size: 40, color: Colors.black);
    case 2:
      return const Icon(Icons.directions_walk, size: 40, color: Colors.black);
    case 3:
      return const Icon(Icons.fitness_center, size: 40, color: Colors.black);
    default:
      return const Icon(Icons.abc, size: 40);
  }
}