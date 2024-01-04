import 'dart:async';
import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';
import 'timer_displays.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  bool isPressed = false;
  bool observed = false;

  Stopwatch watch = Stopwatch();
  late Timer timer;

  int elapsed = 15000;

  startOrStop() {
    setState(() {
      if (!isPressed) {
        isPressed = !isPressed;
        if (observed) {
          watch.start();
          timer = Timer.periodic(
            const Duration(milliseconds: 1),
            (Timer timer) {
              setState(() {
                elapsed = watch.elapsedMilliseconds;
              });
            },
          );
        } else {
          timer = Timer.periodic(
            const Duration(seconds: 1),
            (Timer timer) {
              setState(() {
                if (elapsed != 0) {
                  elapsed -= 1000;
                } else {
                  elapsed = 0;
                  observed = true;
                  isPressed = !isPressed;
                  timer.cancel();
                }
              });
            },
          );
        }
      } else {
        isPressed = !isPressed;
        timer.cancel();
        watch.stop();
      }
    });
  }

  void skipTimer() {
    observed = false;
    setState(() {
      watch.reset();
      elapsed = 15000;
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = (elapsed / 60000).floor();
    int seconds = (elapsed / 1000 - (minutes * 60)).floor();
    int milliseconds = (elapsed - (seconds * 1000) - (minutes * 60000)).floor();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            timerBlock('Minutes', minutes.toString()),
            timerBlock('Seconds', seconds.toString()),
            timerBlock('Milliseconds', milliseconds.toString()),
          ],
        ),
        timerButton(
          startOrStop,
          isPressed ? mainColor : accentColors[0],
          isPressed ? accentColors[0] : mainColor,
          isPressed ? "S T O P" : "S T A R T",
        ),
        isPressed
            ? Container()
            : timerButton(skipTimer, mainColor, accentColors[0], "S K I P"),
      ],
    );
  }
}
