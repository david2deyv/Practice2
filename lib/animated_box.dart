import 'package:flutter/material.dart';
import 'package:practice2/color_provider.dart';
import 'package:provider/provider.dart';

class AnimatedBox extends StatefulWidget {
  @override
  _AnimatedBoxState createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  static const double _width = 300;
  static const double _height = 150;
  static const Duration _animationDuration = Duration(milliseconds: 400);

  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(5);
  ColorProvider _colorProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _colorProvider = Provider.of<ColorProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _colorProvider.color,
            borderRadius: _borderRadius,
          ),
          duration: _animationDuration,
        ),
        RaisedButton(
          onPressed: () => _colorProvider.setState(),
          child: Text('Click'),
        ),
      ],
    );
  }
}