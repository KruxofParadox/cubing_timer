import 'package:cubing_timer/pages/graph_page.dart';
import 'package:cubing_timer/pages/settings_page.dart';
import 'package:cubing_timer/pages/timer_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> pages = [
    const TimerPage(),
    const GraphPage(),
    const SettingsPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            onTabChange: _navigateBottomBar,
            padding: const EdgeInsets.all(8),
            tabs: const [
              GButton(
                icon: Icons.timer_rounded,
                text: 'Timer',
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
      body: pages[_selectedIndex],
    );
  }
}
