import 'dart:async';
import 'package:cubing_timer/components/timer_utils/timer_displays.dart';
import '../const.dart';
import 'package:flutter/material.dart';
import 'countdown_functions.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  // TIMER VARIABLES
  Stopwatch watch = Stopwatch();
  Timer? timer;
  bool countdownStarted = false;
  final int inspectionTime = 15;
  late int countdownTime = inspectionTime;
  String elapsedTime = '0';

  // TIMER BUTTON VARIABLES
  int index = 0;
  List textColors = [mainColor, accentColors[0]];
  List boxColors = [accentColors[0], mainColor];
  List timerMessage = ['S T A R T', 'S K I P'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // BOXES FOR TIME
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            timerBlock('Minutes', "0"),
            timerBlock('Seconds', elapsedTime),
            timerBlock('Milliseconds', "0"),
          ],
        ),

        const SizedBox(height: 100),

        // TIMER BUTTON
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: boxColors[index],
            border: Border.all(
              color: accentColors[0],
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: countdownToggle,
            child: Align(
              child: Text(
                timerMessage[index],
                style: convertFontToUbuntu(
                  20,
                  true,
                  textColors[index],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void countdownToggle() {
    switchButtonPressed();
    countdownStarted = !countdownStarted;
    if (countdownStarted) {
      startCountdown();
    } else {
      endCountdown();
    }
  }

  // Switches the appearance of the button
  void switchButtonPressed() {
    setState(() {
      // cycles through text, box color, and text color
      index++;
      index %= 2;
    });
  }

  void startCountdown() {
    setState(() {
      countdownTime = inspectionTime;
      watch.start();
      timer = Timer.periodic(const Duration(milliseconds: 1), updateTime);
    });
  }

  void endCountdown() {
    setState(() {
      watch.stop();
      watch.reset();
      timer?.cancel();
      elapsedTime = '0';
      beginTiming();
    });
  }

  void updateTime(Timer timer) {
    if (!watch.isRunning) {
      endCountdown();
    } else {
      setState(() {
        elapsedTime = formatCountdownDisplay(watch.elapsedMilliseconds);
      });
      // Checks for if the countdown has reached 0
      if (countdownTime == 0) {
        countdownStarted = !countdownStarted;
        switchButtonPressed();
        endCountdown();
      }
    }
  }

  String formatCountdownDisplay(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();

    setState(() {
      countdownTime = inspectionTime - seconds;
    });

    return '$countdownTime';
  }

  void beginTiming() {}
}
