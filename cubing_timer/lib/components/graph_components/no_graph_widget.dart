import 'package:flutter/material.dart';

class NoGraphDisplay extends StatelessWidget {
  const NoGraphDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          'Not Enough Data for Graph View',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
