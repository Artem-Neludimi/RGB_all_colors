import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  var isTaped = false;

  int randomR = Random().nextInt(256);
  int randomG = Random().nextInt(256);
  int randomB = Random().nextInt(256);

  int randomTextSize = Random().nextInt(81);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All RGB Colors'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.red,
              ],
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() {
            isTaped = true;

            randomR = Random().nextInt(256);
            randomG = Random().nextInt(256);
            randomB = Random().nextInt(256);

            randomTextSize = Random().nextInt(81);
          });
        },
        onLongPress: () {
          HapticFeedback.vibrate();
          setState(() {
            isTaped = false;
          });
        },
        child: Expanded(
          child: Container(
            alignment: Alignment.center,
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            color: !isTaped
                ? Colors.white
                : Color.fromRGBO(randomR, randomG, randomB, 1),
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: !isTaped ? 20 : randomTextSize.toDouble() + 10,
              ),
              duration: const Duration(milliseconds: 100),
              child: Text(
                'Hey there',
                style: TextStyle(
                  color: !isTaped ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
