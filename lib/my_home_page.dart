import 'package:flutter/material.dart';
import 'package:practice2/animated_box.dart';
import 'package:practice2/color_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorProvider _colorProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorProvider = Provider.of<ColorProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Very Cool Title',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _colorProvider.color,
      ),
      body: Center(child: AnimatedBox()),
    );
  }
}