import 'package:flutter/material.dart';

import '../screens/animated_colours_screen.dart';
import '../screens/choose_colour.dart';

class PopupMenuWidget extends StatelessWidget {
  final Color color;
  const PopupMenuWidget({
    Key? key, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert, color: color,),
      onSelected: (String? value) {
        if(value == 'choose colour') {
          Navigator.of(context).pushNamed(ChooseColour.routeName);
        }
        if(value == 'animate colours') {
          Navigator.of(context).pushNamed(AnimatedColoursScreen.routeName);
        }
      },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'choose colour',
            child: Text('Choose a colour'),
          ),
          const PopupMenuItem(
            value: 'animate colours',
            child: Text('Animate colours'),
          ),
        ]);
  }
}