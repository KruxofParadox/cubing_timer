import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

import '../components/settings_utils/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Column(children: [
      const SizedBox(height: 30),
      Container(
          width: 350,
          height: 620,
          decoration: BoxDecoration(
            color: baseGrey,
            borderRadius: BorderRadius.circular(12),
          ),

          // INNER SETTINGS PANE
          child: Column(children: [
            const SizedBox(height: 10),

            // on tap -> instead display general settings page
            SettingsTile(
              text: 'General',
            ),
            const Divider(color: Colors.black),
            SettingsTile(
              text: 'Appearance',
            ),
            const Divider(color: Colors.black),
            SettingsTile(
              text: 'My Portfolio',
            ),
            const Divider(color: Colors.black),
            SettingsTile(
              text: 'Github',
            ),
            const SizedBox(height: 40),

            // IMAGE FOR APP
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Add image here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]))
    ]));
  }
}
