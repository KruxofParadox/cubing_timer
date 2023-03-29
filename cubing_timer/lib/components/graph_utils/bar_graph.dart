import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List<double> solveTimes;

  const MyBarGraph({
    super.key,
    required this.solveTimes,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      solveTimes: solveTimes,
    );

    myBarData.initializeBarData();

    return BarChart(BarChartData(
      maxY: 10,
      minY: 0,
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(
                x: data.x,
                barRods: [BarChartRodData(toY: data.y)],
              ))
          .toList(),
    ));
  }
}
