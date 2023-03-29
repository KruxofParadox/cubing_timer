import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

class NoGraphDisplay extends StatelessWidget {
  const NoGraphDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(
          border: Border.all(
            color: textColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            'Not Enough Data for Graph View',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
