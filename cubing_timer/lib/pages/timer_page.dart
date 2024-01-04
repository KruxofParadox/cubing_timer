import 'package:flutter/material.dart';
import '../components/algorithm_utils/algorithm_slider.dart';
import '../components/timer_utils/timer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // GENERATE SCRAMBLES
        AlgorithmSlider(),

        SizedBox(
          height: 110,
        ),

        // TIMER FOR SOLVES
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TimerWidget(),
        ),
      ],
    );
  }
}
