import 'package:cubing_timer/components/const.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String text;
  bool subMenuOpen;

  SettingsTile({
    super.key,
    required this.text,
    this.subMenuOpen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: !subMenuOpen ? unopenedTile() : Container(),
    );
  }

  Row unopenedTile() {
    return Row(
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
          onPressed: () {
            // direct user to settings_page for that specific setting
            // maybe add in as an input variable?

            subMenuOpen = !subMenuOpen;
          },
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 17,
          ),
        ),
      ],
    );
  }

  Column openedTile() {
    return Column(
      children: [
        unopenedTile(),
        Text('Test text'),
      ],
    );
  }

  void changeMenuOpen() {}
}
