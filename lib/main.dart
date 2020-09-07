import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(providers: [
        ChangeNotifierProvider<CountProvider>.value(value: CountProvider()),
      ], child: MyHomePage()),
    );
  }
}

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  bool state = false;
  double _width = 300;
  double _height = 150;
  // Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    CountProvider _state = Provider.of<CountProvider>(context);

    return Container(
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _state._color,
              borderRadius: _borderRadius,
            ),
            // Define how long the animation should take.
            duration: Duration(seconds: 2),
          ),
          Switch(
            value: state,
            onChanged: (bool s) {
              setState(() {
                state = s;
                _state.setState();
              });
            },
          ),
        ],
      ),
    );
  }
}

class CountProvider extends ChangeNotifier {
  Color _color = Colors.black;

  void setState() {
    // Color _color = Colors.green;
    final random = Random();
    _color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    CountProvider _state = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Very Cool Title',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _state._color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainerApp(),
          ],
        ),
      ),
    );
  }
}
