import 'dart:io';

/// mao ni ang main method
void main() {
  print("===== ROCK, PAPER, SCISSORS =====");

  stdout.write("Enter player 1 name: ");
  String? playerOneName = stdin.readLineSync();
  playerOneName = (playerOneName ?? "").trim();

  if (playerOneName.isEmpty) {
    print('No name entered. Using "Player 1".');
    playerOneName = "Player 1";
  }

  stdout.write("Enter player 2 name: ");
  String? playerTwoName = stdin.readLineSync();
  playerTwoName = (playerTwoName ?? "").trim();

  if (playerTwoName.isEmpty) {
    print('No name entered. Using "Player 2".');
    playerTwoName = "Player 2";
  }

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int round = 1;

  String playAgain;

  do {
    print("\n--- Round $round ---");

    String playerOneMove = getMove(playerOneName);

    for (int i = 0; i < 30; i++) {
      print("");
    }

    String playerTwoMove = getMove(playerTwoName);

    print("\n$playerOneName chose $playerOneMove. $playerTwoName chose $playerTwoMove.");

    String? winner = decideWinner(playerOneName, playerOneMove, playerTwoName, playerTwoMove);

    String? result;

    if (winner != null) {
      result = "$winner wins the round!";
    }

    print("Result: ${result ?? "It's a draw!"}");

    if (winner == playerOneName) {
      playerOneScore++;
    }
    else if (winner == playerTwoName) {
      playerTwoScore++;
    }

    print("Score -> $playerOneName: $playerOneScore | $playerTwoName: $playerTwoScore");

    stdout.write("Play again? (y/n): ");

    playAgain = (stdin.readLineSync() ?? "n").trim().toLowerCase();

    round++;

  } while (playAgain == "y");

  print("\n===== FINAL SCORE =====");
  print("$playerOneName: $playerOneScore | $playerTwoName: $playerTwoScore");

  if (playerOneScore > playerTwoScore) {
    print("Overall winner: $playerOneName");
  }
  else if (playerTwoScore > playerOneScore) {
    print("Overall winner: $playerTwoName");
  }
  else {
    print("Overall result: Draw");
  }
}

/// iyang kuhaon ang valide ra nga move sa player
String getMove(String playerName) {
  String? validMove;

  do {
    stdout.write("Enter your move $playerName (rock, paper, scissors): ");

    String? playerMove = stdin.readLineSync();

    validMove = validateMove(playerMove);

    if (validMove == null) {
      print("Invalid move. Please type rock, paper, or scissors.");
    }

  } while (validMove == null);
  return validMove;
}

/// e validate niya ang na pick nga move ni player
String? validateMove(String? move) {
  List<String> validMoves = List.filled(3, "", growable: false);

  validMoves[0] = "rock";
  validMoves[1] = "paper";
  validMoves[2] = "scissors";

  String correctMove = (move ?? "").trim().toLowerCase();

  if (validMoves.contains(correctMove)) {
    return correctMove;
  }

  return null;
}

/// iyang e evaluate kung kinsa ang winner
String? decideWinner(String playerOneName, String playerOneMove, String playerTwoName, String playerTwoMove) {

  if (playerOneMove == playerTwoMove) {
    return null;
  }
  else if (playerOneMove == "rock" && playerTwoMove == "scissors") {
    return playerOneName;
  }
  else if (playerOneMove == "paper" && playerTwoMove == "rock") {
    return playerOneName;
  }
  else if (playerOneMove == "scissors" && playerTwoMove == "paper") {
    return playerOneName;
  }
  else {
    return playerTwoName;
  }
}