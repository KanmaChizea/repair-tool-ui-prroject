import 'package:flutter/material.dart';

class Offers {
  final String validityDate;
  final String infoText;
  final String imagePath;
  final Color headerColor;
  final Color bodyColor;

  Offers({
    required this.validityDate,
    required this.infoText,
    required this.imagePath,
    required this.headerColor,
    required this.bodyColor,
  });
}
