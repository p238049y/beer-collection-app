import 'package:flutter/material.dart';

Icon convertTypeToIcon(int workOutType) {
  switch (workOutType) {
    case 0:
      return const Icon(Icons.directions_run, size: 40, color: Colors.black);
    case 1:
      return const Icon(Icons.fitness_center, size: 40, color: Colors.black);
    case 2:
      return const Icon(Icons.sports, size: 40, color: Colors.black);
    default:
      return const Icon(Icons.abc, size: 40);
  }
}
