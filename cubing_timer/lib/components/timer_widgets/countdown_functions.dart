import 'dart:async';
import 'package:flutter/material.dart';

Stopwatch watch = Stopwatch();
Timer? timer;
bool countdownStarted = false;
int countdownDuration = 15;
late int countdownTime = countdownDuration;

String elapsedTime = '0';

void countdownToggle() {
  !countdownStarted ? startCountdown() : endCountdown();
}

void startCountdown() {
  countdownTime = countdownDuration;
  countdownStarted = !countdownStarted;
  watch.start();
  timer = Timer.periodic(const Duration(milliseconds: 1), updateTime);
}

void endCountdown() {
  countdownStarted = !countdownStarted;
  watch.stop();
  watch.reset();
  timer?.cancel();
  elapsedTime = '0';
}

void updateTime(Timer timer) {
  if (watch.isRunning && (countdownTime > 0)) {
    elapsedTime = formatCountdownDisplay(watch.elapsedMilliseconds);
  } else {
    endCountdown();
  }
}

String formatCountdownDisplay(int milliseconds) {
  int seconds = (milliseconds / 1000).truncate();

  countdownTime = countdownDuration - seconds;

  return '$countdownTime';
}
