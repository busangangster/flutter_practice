import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedcontrainerPage extends StatefulWidget {
  const AnimatedcontrainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedcontrainerPageState createState() => _AnimatedcontrainerPageState();
}

class _AnimatedcontrainerPageState extends State<AnimatedcontrainerPage> {
  var _size = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
        ),
        body: Center(
            child: GestureDetector(
                onTap: () {
                  final random = Random();
                  setState(() {
                    _size = random.nextInt(200).toDouble() + 100;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: _size,
                  height: _size,
                  child: Image.asset('assets/sample.jpg'),
                  curve: Curves.fastOutSlowIn,
                ))));
  }
}
