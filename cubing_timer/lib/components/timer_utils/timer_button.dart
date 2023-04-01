import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerButton extends StatefulWidget {
  final Function() callback;

  TimerButton({
    super.key,
    required this.callback,
  });

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  int index = 0;
  List textColors = [mainColor, accentColors[0]];
  List boxColors = [accentColors[0], mainColor];
  List timerMessage = ['S T A R T', 'S K I P'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          color: boxColors[index],
          border: Border.all(
            color: accentColors[0],
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              // inverts text and box color and updates message
              index++;
              index %= 2;

              // run callback function
              widget.callback();
            });
          },
          child: Align(
            child: Text(timerMessage[index],
                style: convertFontToUbuntu(
                  20,
                  true,
                  textColors[index],
                )),
          )),
    );
  }
}
