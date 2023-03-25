import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      // Unit display
      Text(
        '$label',
        style: timerLabels(),
      ),
    ],
  );
}

// DECORATION FOR BOX AROUND TIME
BoxDecoration timerDecoration() {
  return BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(20),
  );
}

// TEXT UNDER TIME DISPLAY
TextStyle timerLabels() {
  return GoogleFonts.ubuntu(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}
