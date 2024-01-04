import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

// LABELS AND BOX PUT TOGETHER
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

      const SizedBox(
        height: 6,
      ),
      // Unit display
      Text(
        '$label',
        style: convertFontToUbuntu(18, true, textColor),
      ),
    ],
  );
}

// DECORATION FOR BOX AROUND TIME
BoxDecoration timerDecoration() {
  return BoxDecoration(
    color: baseGrey,
    borderRadius: BorderRadius.circular(20),
  );
}

// BUTTON FOR TIMER START/STOP/SKIP FUNCTIONS
Padding timerButton(
    Function() skipTimer, Color accentColor, Color mainColor, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        color: accentColor,
        border: Border.all(
          color: mainColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          skipTimer();
        },
        child: Align(
          child: Text(
            text,
            style: convertFontToUbuntu(
              20,
              true,
              mainColor,
            ),
          ),
        ),
      ),
    ),
  );
}
