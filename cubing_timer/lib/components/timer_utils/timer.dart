import 'package:cubing_timer/components/const.dart';
import 'package:cubing_timer/components/controllers/algorithm_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/timer_controller.dart';
import 'timer_displays.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<TimerController>(
          builder: (context, time, child) {
            int minutes = (time.timerModel.elapsed / 60000).floor();
            int seconds =
                (time.timerModel.elapsed / 1000 - (minutes * 60)).floor();
            int milliseconds =
                (time.timerModel.elapsed - (seconds * 1000) - (minutes * 60000))
                    .floor();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                timerBlock('Minutes', minutes.toString()),
                timerBlock('Seconds', seconds.toString()),
                timerBlock('Milliseconds', milliseconds.toString()),
              ],
            );
          },
        ),
        Consumer<TimerController>(
          builder: (context, time, child) {
            var time = context.read<TimerController>();
            bool started = time.timerModel.start;
            bool attempted = time.timerModel.attempted;
            return Column(
              children: [
                attempted
                    ? Container()
                    : timerButton(
                        () {
                          time.startStopButton();
                        },
                        started ? mainColor : accentColors[0],
                        started ? accentColors[0] : mainColor,
                        started ? "S T O P" : "S T A R T",
                      ),
                Consumer<AlgorithmSliderController>(
                    builder: (context, slider, child) {
                  return attempted
                      ? timerButton(() {
                          time.saveAttempt();
                          slider.changeAlgorithm();
                        }, mainColor, accentColors[0], "S A V E")
                      : timerButton(() {
                          time.skipAlgorithm();
                          slider.changeAlgorithm();
                        }, mainColor, accentColors[0], "S K I P");
                })
              ],
            );
          },
        ),
      ],
    );
  }
}
