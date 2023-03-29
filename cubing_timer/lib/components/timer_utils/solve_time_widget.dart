import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

class SolveTimeWidget extends StatelessWidget {
  final double solveTime;

  const SolveTimeWidget({
    super.key,
    required this.solveTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: baseGrey,
      ),
      child: Center(
        child: Text(
          solveTime.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
