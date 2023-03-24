import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'algorithms.dart';

class AlgorithmSlider extends StatefulWidget {
  const AlgorithmSlider({super.key});

  @override
  State<AlgorithmSlider> createState() => _AlgorithmSliderState();
}

class _AlgorithmSliderState extends State<AlgorithmSlider> {
  String scramble = combineScramble();

  void setScramble() {
    setState(() {
      scramble = combineScramble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Scrollable(
          viewportBuilder: (BuildContext context, position) => Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    setScramble();
                  }),
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                  borderRadius: BorderRadius.circular(100),
                  icon: Icons.refresh,
                ),
              ],
            ),
            child: Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  scramble,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
