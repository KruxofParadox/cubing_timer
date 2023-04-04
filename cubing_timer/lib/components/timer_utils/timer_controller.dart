import 'package:flutter/material.dart';

class TimerController extends ChangeNotifier {
  bool isPressed;
  TimerController(this.isPressed);

  changeIsPressed() {
    isPressed = !isPressed;
  }
}
