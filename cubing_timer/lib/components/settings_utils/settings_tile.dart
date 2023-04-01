import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String text;

  const SettingsTile({
    super.key,
    required this.text,
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
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
