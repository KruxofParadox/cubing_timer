import 'dart:async';

import 'package:cubing_timer/models/timer_model.dart';
import 'package:flutter/material.dart';

/*

Using flutter state-management package "provider" (their default past setState)

This is the "Controller" in VMC architecture; the place where a 
conceptual-object (the timer) can be manipulated for use within the UI

All state changes and logic are handled here, so that fixing things unrelated
to UI issues is a bit easier! :) 

you also get to access all the information about a timing run through this
setup, which makes passing information between pages breezy.

 */
class TimerController extends ChangeNotifier {
  final TimerModel _timerModel = TimerModel(
    elapsed: 15000,
    start: false,
    observed: false,
    attempted: false,
  );

  TimerModel get timerModel => _timerModel;

  late Timer _countdownTimer;

  final Stopwatch _watch = Stopwatch();

  void startStopButton() {
    if (!_timerModel.start) {
      if (!_timerModel.observed) {
        countDown();
      } else {
        countUp();
      }
    } else {
      tempStop();
    }
    notifyListeners();
  }

  void countDown() {
    _timerModel.start = true;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerModel.elapsed > 0) {
        _timerModel.elapsed -= 1000;
      } else {
        prepTimer();
      }
      notifyListeners();
    });
  }

  void countUp() {
    _watch.start();
    _timerModel.attempted = true;
    _timerModel.start = true;
    _countdownTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      _timerModel.elapsed = _watch.elapsedMilliseconds;
      notifyListeners();
    });
  }

  void tempStop() {
    if (_watch.isRunning) {
      _watch.stop();
    }
    _timerModel.start = false;
    _countdownTimer.cancel();
  }

  void skipAlgorithm() {
    resetTimer();
    notifyListeners();
  }

  void saveAttempt() {
    skipAlgorithm();
    _timerModel.attempted = false;
  }

  void prepTimer() {
    _countdownTimer.cancel();
    _timerModel.elapsed = 0;
    _timerModel.start = false;
    _timerModel.observed = true;
  }

  void resetTimer() {
    _timerModel.elapsed = 15000;
    _countdownTimer.cancel();
    _timerModel.observed = false;
  }
}
