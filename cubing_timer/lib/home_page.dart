import 'package:cubing_timer/pages/graph_page.dart';
import 'package:cubing_timer/pages/settings_page.dart';
import 'package:cubing_timer/pages/timer_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'components/const.dart';
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
    SettingsPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: _determineAppBar(_selectedIndex),
      bottomNavigationBar: Container(
        color: baseGrey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GNav(
            backgroundColor: baseGrey,
            color: textColor,
            activeColor: mainColor,
            tabBackgroundColor: accentColors[0],
            gap: 8,
            onTabChange: _navigateBottomBar,
            padding: const EdgeInsets.all(8),
            tabs: [
              GButton(
                icon: Icons.timer_rounded,
                text: 'Timer',
                textStyle: convertFontToUbuntu(
                  15,
                  true,
                  mainColor,
                ),
              ),
              GButton(
                icon: Icons.bar_chart_rounded,
                text: 'Graph',
                textStyle: convertFontToUbuntu(
                  15,
                  true,
                  mainColor,
                ),
              ),
              GButton(
                icon: Icons.settings_rounded,
                text: 'Settings',
                textStyle: convertFontToUbuntu(
                  15,
                  true,
                  mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: pages[_selectedIndex],
    );
  }

  AppBar _determineAppBar(index) {
    // TIMER PAGE
    if (index == 0) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
      // STATS PAGE
    } else if (index == 1) {
      return AppBar(
        title: Center(
          child: Text(
            'Stats',
            style: convertFontToUbuntu(
              28,
              true,
              mainColor,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      );
      // SETTINGS PAGE
    } else {
      return AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: convertFontToUbuntu(
              28,
              true,
              mainColor,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      );
    }
  }
}
