import 'package:cubing_timer/components/const.dart';
import 'package:cubing_timer/components/settings_utils/settings_tile.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),

          const SizedBox(height: 30),

          Container(
            width: 350,
            height: 560,
            decoration: BoxDecoration(
              color: baseGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const SettingsTile(text: 'General'),
                const Divider(color: Colors.black),
                const SettingsTile(text: 'Appearance'),
                const Divider(color: Colors.black),
                const SettingsTile(text: 'My Portfolio'),
                const Divider(color: Colors.black),
                const SettingsTile(text: 'Github'),
                const SizedBox(height: 40),
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
              ],
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 20),
          //       height: 50,
          //       width: 150,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12),
          //         color: baseGrey,
          //       ),
          //       child: const Center(
          //         child: Text(
          //           'Appearance',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 20),
          //       height: 50,
          //       width: 150,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12),
          //         color: baseGrey,
          //       ),
          //       child: const Center(
          //         child: Text(
          //           'General',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
