import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey there',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Hey there'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  Random _rnd = Random();

  void _randomlyChangeColor() {
    setState(() {
      // We fill alpha with max value to always see the color
      final int alpha = 255;

      // Random uses exclusive bound as its argument for generation
      final int rndColorUpperBound = 256;
      var red = _rnd.nextInt(rndColorUpperBound);
      var green = _rnd.nextInt(rndColorUpperBound);
      var blue = _rnd.nextInt(rndColorUpperBound);

      _backgroundColor = Color.fromARGB(alpha, red, green, blue);

      // Inverting the color, not alpha channel
      _textColor = Color(_backgroundColor.value ^ 0xffffff);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _randomlyChangeColor();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: _backgroundColor,
          child: Center(
            child: Text(
              'Hey there',
              style: Theme.of(context).textTheme.display1.apply(color: _textColor)
              )
          )
        )
      )
    );
  }
}
