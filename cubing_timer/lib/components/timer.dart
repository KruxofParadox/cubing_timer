import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'timer_button.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int minutes = 0;
  int seconds = 0;
  int milliseconds = 0;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      width: 400,
      height: 500,
      child: Column(
        children: [
          // BOXES FOR TIME
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              timerBlock('Minutes', minutes),
              timerBlock('Seconds', seconds),
              timerBlock('Milliseconds', milliseconds),
            ],
          ),

          const SizedBox(
            height: 100,
          ),

          // BUTTON TO START TIMER
          TimerButton(
              minutes: minutes,
              seconds: seconds,
              milliseconds: milliseconds,
              callback: (p0) {
                inspectionCountdown();
              }),
        ],
      ),
    );
  }

  void inspectionCountdown() {
    seconds = 15;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();

        /// TODO: Button Functionality
        /// Once timer hits 0 -> begin counting up from 0
        /// Once button is pressed again -> stop the timer
      }
    });
  }

  Column timerBlock(label, time) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Number display
        Container(
          height: 95,
          width: 95,
          decoration: timerDecoration(),
          child: Center(
            child: Text(
              time.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Unit display
        Text(
          '$label',
          style: timerLabels(),
        ),
      ],
    );
  }

  BoxDecoration timerDecoration() {
    return BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
    );
  }

  TextStyle timerLabels() {
    return GoogleFonts.ubuntu(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
