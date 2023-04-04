import 'dart:async';
import 'package:cubing_timer/components/timer_utils/timer_controller.dart';
import 'package:cubing_timer/components/timer_utils/timer_displays.dart';
import 'timer_button.dart';
import 'package:flutter/material.dart';
import 'countdown_functions.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Stopwatch watch = Stopwatch();
  Timer? timer;
  bool countdownStarted = false;
  int countdownDuration = 15;
  late int countdownTime = countdownDuration;
  late final controller = TimerController(countdownStarted);

  String elapsedTime = '0';

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

        // BUTTON TO START TIMER
        TimerButton(
          callback: countdownToggle,
          controller: controller,
        ),
      ],
    );
  }

  void countdownToggle() {
    !countdownStarted ? startCountdown() : endCountdown();
  }

  void startCountdown() {
    setState(() {
      countdownTime = countdownDuration;
      countdownStarted = !countdownStarted;
      watch.start();
      timer = Timer.periodic(const Duration(milliseconds: 1), updateTime);
    });
  }

  void endCountdown() {
    setState(() {
      countdownStarted = !countdownStarted;
      watch.stop();
      watch.reset();
      timer?.cancel();
      elapsedTime = '0';
      beginTiming();
    });
  }

  void updateTime(Timer timer) {
    if (watch.isRunning && (countdownTime > 0)) {
      setState(() {
        elapsedTime = formatCountdownDisplay(watch.elapsedMilliseconds);
      });
    } else {
      endCountdown();
    }
  }

  String formatCountdownDisplay(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();

    setState(() {
      countdownTime = countdownDuration - seconds;
    });

    return '$countdownTime';
  }

  void beginTiming() {}
}
