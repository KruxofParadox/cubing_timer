import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cubing_timer/components/const.dart';
import 'package:provider/provider.dart';
import '../../controllers/algorithm_slider_controller.dart';

class AlgorithmSlider extends StatelessWidget {
  const AlgorithmSlider({super.key});

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
                onPressed: ((context) {}),
                backgroundColor: baseGrey,
                foregroundColor: textColor,
                borderRadius: BorderRadius.circular(100),
                icon: Icons.refresh,
              ),
            ],
          ),
          child: Container(
              color: mainColor,
              child: Consumer<AlgorithmSliderController>(
                  builder: (context, slider, child) {
                return ListTile(
                  title: Text(
                    slider.scramble,
                    textAlign: TextAlign.center,
                    style: convertFontToUbuntu(
                      22,
                      false,
                      Colors.black,
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
