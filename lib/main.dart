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
      // fixme multi provider? We have only 1 provide. fix it
      home: MultiProvider(providers: [
        ChangeNotifierProvider<CountProvider>.value(value: CountProvider()),
      ], child: MyHomePage()), // fixme add trailing coma
    );
  }
}

// fixme change name
class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // fixme change name
  bool state = false;
  // fixme must be const
  double _width = 300;
  double _height = 150;

  // fixme remove comment
  // Color _color = Colors.green;
  // fixme add final
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    // fixme move out of build method, change name
    CountProvider _state = Provider.of<CountProvider>(context);

    // fixme redundant Container widget
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
            // fixme 2 seconds it's too long. Change to 200-600 millis
            // fixme move value to class property as private static const value
            duration: Duration(seconds: 2),
          ),
          // fixme not the best solution here. Change to regular button
          Switch(
            value: state,
            onChanged: (bool s) {
              setState(() {
                state = s;
                // fixme move out of setState func
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
  // fixme make it public
  Color _color = Colors.black;

  void setState() {
    // Color _color = Colors.green;
    // fixme don't crete random object every time. Move to class field
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
    // fixme move out of build method
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
        // fixme redundant Column widget
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
