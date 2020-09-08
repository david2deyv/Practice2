import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  final _random = Random();
  Color color = Colors.black;

  void setState() {
    color = Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
    notifyListeners();
  }
}