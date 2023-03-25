import 'package:cubing_timer/components/algorithms/algorithm_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      bottomNavigationBar: Container(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GNav(
            backgroundColor: Colors.grey.shade300,
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.deepPurple,
            gap: 8,
            padding: const EdgeInsets.all(8),
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                icon: Icons.bar_chart_rounded,
                text: 'Graph',
              ),
              GButton(
                icon: Icons.settings_rounded,
                text: 'Settings',
              ),
            ],
          ),
        ),
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
