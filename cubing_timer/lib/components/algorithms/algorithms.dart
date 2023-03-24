import 'dart:math';

var listOfFaces3x3 = ['F', 'B', 'L', 'R', 'U', 'D'];
int numberOfFaces3x3 = 6;
int numberOfMoves = 25;

// Gets which face of the cube should be turned
String getFace() {
  var rng = Random();
  String face = listOfFaces3x3[rng.nextInt(numberOfFaces3x3)];

  return face;
}

// Generate list of face moves
List _scrambleMoves() {
  var scramble = [getFace()];
  var queue = scramble[0];

  for (int i = 1; i < numberOfMoves; i++) {
    String face = getFace();
    while (queue == face) {
      face = getFace();
    }
    scramble.add(face);
    queue = face;
  }

  return scramble;
}

// Generate list of ways to change face moves -> counterclockwise and double turns
List scrambleAdditions() {
  var additions = [];
  var rng = Random();

  for (int i = 0; i < numberOfMoves; i++) {
    int determineAddOn = rng.nextInt(6);

    if (determineAddOn == 0 || determineAddOn == 1) {
      additions.add('\'');
    } else if (determineAddOn == 2) {
      additions.add('2');
    } else {
      additions.add('');
    }
  }

  return additions;
}

// Combine the face moves and additions and convert to a string for the app
String combineScramble() {
  var moves = _scrambleMoves();
  var additions = scrambleAdditions();

  String scramble = '';
  for (int i = 0; i < numberOfMoves; i++) {
    scramble = '$scramble${moves[i]}${additions[i]} ';
  }
  return scramble;
}
