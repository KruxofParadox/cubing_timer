/*

This is the "Model" in VMC architecture; the place where a 
conceptual-object (the timer) can be defined for use within the UI.

main key -- KEEP VARIABLES YOU NEED FOR THE UI HERE. This is what you will use
to get to their values.

 */

class TimerModel {
  int elapsed;
  bool start;
  bool observed;
  bool attempted;

  TimerModel({
    required this.elapsed,
    required this.start,
    required this.observed,
    required this.attempted,
  });
}
