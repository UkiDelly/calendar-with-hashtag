import 'package:flutter/material.dart';

class Account {
  String name;
  Color color;

  Account({
    required this.name,
    required this.color,
  });

  @override
  String toString() {
    return "Account(name: $name, color: $color)";
  }
}
