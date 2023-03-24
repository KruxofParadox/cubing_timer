import 'package:cubing_timer/components/algorithms/algorithm_slider.dart';
import 'components/timer_components/timer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      // padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      // margin: const EdgeInsets.all(10),

      body: Column(
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
      ),
    );
  }
}
