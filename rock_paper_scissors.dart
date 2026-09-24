import 'dart:io';

void main() {
  print("===== ROCK, PAPER, SCISSORS =====");
  stdout.write("Enter player 1 name: "); 
  String? playerOneName = stdin.readLineSync();
  String? playerOne = (playerOneName ?? "").trim().toLowerCase();
  if (playerOne.isEmpty) {
    playerOne = "Player 1";
  }

  stdout.write("Enter player 2 name: ");
  String? playerTwoName = stdin.readLineSync();
  String? playerTwo = (playerTwoName ?? "").trim().toLowerCase();
  if (playerTwo.isEmpty) {
    playerTwo = "Player 2";
  }
}


String getMove(String playerName) {
  String? validMove;
  do {
    stdout.write("Enter your move $playerName[rock, paper, scissors]: ");
    String? playerMove = stdin.readLineSync();
    validMove = validateMove(playerMove);
    if (validMove == null) {
      print("Choose rock, paper, scissor only!");
    }
  } while (validMove == null);

  return validMove;
}

String? validateMove(String? move) {
  List<String?> validMoves = List.filled(3, null, growable: false);
  validMoves[0] = "rock";
  validMoves[1] = "paper";
  validMoves[2] = "scissor";

  String correctMove = (move ?? "").trim().toLowerCase();
  if (validMoves.contains(correctMove)) {
    return correctMove;
  }
}

String? decideWinner(String playerOneName, String playerOneMove, String playerTwoName, String playerTwoMove) {
  if (playerOneMove == playerTwoMove) {
    return null;
  }
  else if (playerOneMove == "rock" && playerTwoMove == "scissor") {
    return playerOneName;
  }
  else if (playerOneMove == "paper" && playerTwoMove == "rock") {
    return playerOneName;
  }
  else if (playerOneMove == "scissor" && playerTwoMove == "paper") {
    return playerOneName;
  }
  else {
    return playerTwoName;
  }
}
