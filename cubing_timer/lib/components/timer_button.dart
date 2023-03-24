import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerButton extends StatefulWidget {
  int minutes;
  int seconds;
  int milliseconds;
  final Function(bool) callback;

  TimerButton({
    super.key,
    required this.minutes,
    required this.seconds,
    required this.milliseconds,
    required this.callback,
  });

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  bool buttonPressed = false;
  int index = 0;
  List textColors = [Colors.white, Colors.deepPurple];
  List boxColors = [Colors.deepPurple, Colors.white];
  List timerMessage = ['S T A R T', 'S K I P'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
          color: boxColors[index],
          border: Border.all(
            color: Colors.deepPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              // inverts text and box color and changes text
              index++;
              index %= 2;

              // if button has been pressed -> mark it
              buttonPressed = !buttonPressed;

              // run callback function
              widget.callback(buttonPressed);
            });
          },
          child: Align(
            child: Text(timerMessage[index],
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColors[index],
                  ),
                )),
          )),
    );
  }
}
