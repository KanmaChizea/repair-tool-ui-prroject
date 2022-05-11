import 'dart:convert';

import 'package:capstone_project_practice/models/appliance_model.dart';

class CartItem {
  final String iconPath;
  final String name;
  final Map<String, int> services;
  CartItem({
    required this.iconPath,
    required this.name,
    required this.services,
  });
}
