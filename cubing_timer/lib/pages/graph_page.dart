import 'package:cubing_timer/components/const.dart';
import 'package:cubing_timer/components/graph_utils/bar_graph.dart';
import 'package:cubing_timer/components/graph_utils/no_graph_widget.dart';
import 'package:cubing_timer/components/timer_utils/solve_time_widget.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> solveTimes = [5.15, 6.43];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                child: solveTimes.isEmpty
                    ? const NoGraphDisplay()
                    : MyBarGraph(solveTimes: solveTimes)),
            const SizedBox(height: 10),

            // FILTER BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: baseGrey, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.filter),
                )
              ],
            ),

            const SizedBox(height: 10),

            /// TODO:
            /// Replace below with Listview.builder -> display individual solves with slidable widget
            /// slide on side to delete
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SolveTimeWidget(solveTime: solveTimes[0]),
                    SolveTimeWidget(solveTime: solveTimes[1]),
                  ],
                ),
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
