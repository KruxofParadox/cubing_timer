import 'package:cubing_timer/components/algorithms/algorithm_slider.dart';
import 'components/timer_widgets/timer.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
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
