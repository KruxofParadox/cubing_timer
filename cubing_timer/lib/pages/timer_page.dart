import 'package:flutter/material.dart';

import '../components/algorithms/algorithm_slider.dart';
import '../components/timer_widgets/timer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
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
