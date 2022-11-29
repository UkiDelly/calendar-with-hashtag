import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  factory Account({
    required String id,
    required String name,
    required Color color,
  }) = _Account;
}

// class Account {
//   String name;
//   Color color;

//   Account({
//     required this.name,
//     required this.color,
//   });

//   @override
//   String toString() {
//     return "Account(name: $name, color: $color)";
//   }
// }
