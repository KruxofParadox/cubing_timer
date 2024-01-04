import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/algorithm_utils/algorithm_slider.dart';
import '../components/controllers/algorithm_slider_controller.dart';
import '../components/controllers/timer_controller.dart';
import '../components/timer_utils/timer.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => AlgorithmSliderController()),
          ChangeNotifierProvider(
            create: ((context) => TimerController()),
          )
        ],
        child: const Column(
          children: [
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
        ));
    // GENERATE SCRAMBLES
  }
}
