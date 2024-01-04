import 'package:flutter/material.dart';

import '../../models/timer_model.dart';
import '../algorithm_utils/algorithms.dart';

class AlgorithmSliderController extends ChangeNotifier {
  final TimerModel _timerModel = TimerModel(
    elapsed: 15000,
    start: false,
    observed: false,
    attempted: false,
  );

  TimerModel get timerModel => _timerModel;
  String _scramble = combineScramble();
  String get scramble => _scramble;

  void changeAlgorithm() {
    _scramble = combineScramble();
    notifyListeners();
  }
}
