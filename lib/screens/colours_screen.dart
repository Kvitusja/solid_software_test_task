import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/popup_menu_widget.dart';

class ColoursScreen extends StatefulWidget {
  const ColoursScreen({Key? key}) : super(key: key);

  @override
  State<ColoursScreen> createState() => _ColoursScreenState();
}

class _ColoursScreenState extends State<ColoursScreen> {
  Color decorationColour = Colors.black;
  final random = Random();
  Color randomColour = const Color.fromRGBO(255, 255, 255, 1);

  void randomRGBO() {
    setState(() {
      randomColour = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        random.nextDouble(),
      );
      decorationColour = getTextColorForBackground(randomColour);
    });
  }

  Color getTextColorForBackground(Color backgroundColour) {
    if (ThemeData.estimateBrightnessForColor(backgroundColour) ==
        Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuWidget(
            color: decorationColour,
          ),
        ],
      ),
      body: InkWell(
        onTap: randomRGBO,
        child: Container(
          color: randomColour,
          child: Center(
            child: Text(
              style: TextStyle(fontSize: 16, color: decorationColour),
              'Hey there',
            ),
          ),
        ),
      ),
    );
  }
}
