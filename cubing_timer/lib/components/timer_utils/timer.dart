import 'dart:async';
import 'package:cubing_timer/components/timer_utils/timer_displays.dart';
import '../const.dart';
import 'package:flutter/material.dart';
// import 'countdown_functions.dart';

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
  bool timerStarted = false;
  final int inspectionTime = 15;
  late int timerTime;
  String millisecondsTime = '0';
  String secondsTime = '0';
  String minutesTime = '0';

  // TIMER BUTTON VARIABLES
  int index = 0;
  List textColors = [mainColor, accentColors[0], accentColors[0]];
  List boxColors = [accentColors[0], mainColor, mainColor];
  List timerMessage = ['S T A R T', 'S K I P', 'S T O P'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // BOXES FOR TIME
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            timerBlock('Minutes', minutesTime),
            timerBlock('Seconds', secondsTime),
            timerBlock('Milliseconds', millisecondsTime),
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
            onTap: timerToggle,
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

  // TIMING FOR USER INSPECTION
  void timerToggle() {
    switchButtonPressed();
    countdownStarted = !countdownStarted;
    if (countdownStarted) {
      startTimer();
    } else {
      endTimer();
    }
  }

  void startTimer() {
    setState(() {
      watch.start();
      timer =
          Timer.periodic(const Duration(milliseconds: 1), updateCountdownTime);
    });
  }

  void updateCountdownTime(Timer timer) {
    if (!watch.isRunning) {
      endTimer();
    }

    setState(() {
      secondsTime = formatCountdownDisplay(watch.elapsedMilliseconds);
    });
    // Checks for if the countdown has reached 0
    if (timerTime == 0) {
      countdownStarted = !countdownStarted;
      switchButtonPressed();
      endTimer();
    }
  }

  String formatCountdownDisplay(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();

    setState(() {
      timerTime = inspectionTime - seconds;
    });

    return '$timerTime';
  }

  // Switches the appearance of the button
  void switchButtonPressed() {
    setState(() {
      // cycles through text, box color, and text color
      index++;
      index %= 3;
    });
  }

  void endTimer() {
    setState(() {
      watch.stop();
      watch.reset();
      timer?.cancel();
      secondsTime = '0';
    });

    if (!timerStarted) {
      beginTiming();
    }
  }

  // TIMING FOR USER SOLVE
  void beginTiming() {
    setState(() {
      watch.start();
      timer = Timer.periodic(const Duration(milliseconds: 1), updateTime);
    });
  }

  void updateTime(Timer timer) {
    if (!watch.isRunning) {
      endTimer();
    }

    List times = formatTimerDisplay(watch.elapsedMilliseconds);

    setState(() {
      millisecondsTime = times[0];
      secondsTime = times[1];
      minutesTime = times[2];
    });
    // Checks for if the countdown has reached 0
    if (timerTime == 10000) {
      countdownStarted = !countdownStarted;
      switchButtonPressed();
      endTimer();
    }
  }

  List formatTimerDisplay(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();

    int displayMinutes = minutes;
    int displaySeconds = seconds % 60;
    int displayMilliseconds = ((milliseconds % 1000) / 10).truncate();

    setState(() {
      timerTime = milliseconds;
    });

    return ['$displayMilliseconds', '$displaySeconds', '$displayMinutes'];
  }
}
