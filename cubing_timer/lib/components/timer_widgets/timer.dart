import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
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

  String elapsedTime = '0';

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
              timerBlock('Minutes', "0"),
              timerBlock('Seconds', elapsedTime),
              timerBlock('Milliseconds', "0"),
            ],
          ),

          const SizedBox(
            height: 100,
          ),

          // BUTTON TO START TIMER
          TimerButton(
            buttonPressed: 0,
            callback: countdownToggle,
          ),
        ],
      ),
    );
  }

  void countdownToggle() {
    !countdownStarted ? startCountdown() : stopCountdown();
  }

  void startCountdown() {
    setState(() {
      countdownTime = countdownDuration;
      countdownStarted = !countdownStarted;
      watch.start();
      timer = Timer.periodic(const Duration(milliseconds: 1), updateTime);
    });
  }

  void stopCountdown() {
    setState(() {
      countdownStarted = !countdownStarted;
      watch.stop();
      watch.reset();
      timer?.cancel();
      elapsedTime = '0';
    });
  }

  void updateTime(Timer timer) {
    if (watch.isRunning && (countdownTime > 0)) {
      setState(() {
        elapsedTime = formatCountdownDisplay(watch.elapsedMilliseconds);
      });
    } else {
      stopCountdown();
    }
  }

  String formatCountdownDisplay(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();

    setState(() {
      countdownTime = countdownDuration - seconds;
    });

    return '$countdownTime';
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
