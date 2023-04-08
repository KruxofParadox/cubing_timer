import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String text;
  int index;

  SettingsTile({
    super.key,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: convertFontToUbuntu(
              20,
              true,
              textColor,
            ),
          ),
          IconButton(
            onPressed:
                // direct user to settings_page for that specific setting
                // maybe add in as an input variable?

                () {
              index++;
            },
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
