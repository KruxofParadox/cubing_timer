import 'individual_bar.dart';

class BarData {
  List<double> solveTimes;

  BarData({
    required this.solveTimes,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    for (var i = 0; i < solveTimes.length; i++) {
      barData.add(
        IndividualBar(
          x: i,
          y: solveTimes[i],
        ),
      );
    }
  }
}
