import 'package:flutter/material.dart';
import 'package:practice2/color_provider.dart';
import 'package:practice2/my_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ColorProvider>.value(
        value: ColorProvider(),
        child: MyHomePage(),
      ),
    );
  }
}
