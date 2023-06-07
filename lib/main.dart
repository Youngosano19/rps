import 'package:flutter/material.dart';
import 'dart:math';

enum Choice { rock, paper, scissors }

class RPSGame extends StatefulWidget {
  const RPSGame({Key? key}) : super(key: key);

  @override
  _RPSGameState createState() => _RPSGameState();
}

class _RPSGameState extends State<RPSGame> with GameLogicMixin {
  Choice userChoice = Choice.rock;
  Choice computerChoice = Choice.rock; // Initialize with a default value
  String result = '';
  void playGame(Choice userChoice) {
    setState(() {
      // Generate random computer choice
      computerChoice = Choice.values[Random().nextInt(Choice.values.length)];

      // Determine the winner
      result = determineWinner(userChoice, computerChoice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock Paper Scissors'),
      ),
      body: Column(
        children: [
          const Text(
            'Choose your move:',
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => playGame(Choice.rock),
                child: const Text('Rock'),
              ),
              ElevatedButton(
                onPressed: () => playGame(Choice.paper),
                child: const Text('Paper'),
              ),
              ElevatedButton(
                onPressed: () => playGame(Choice.scissors),
                child: const Text('Scissors'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            result,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

mixin GameLogicMixin {
  String determineWinner(Choice userChoice, Choice computerChoice) {
    // Determine the winner
    if (userChoice == computerChoice) {
      return "It's a tie!";
    } else if ((userChoice == Choice.rock &&
            computerChoice == Choice.scissors) ||
        (userChoice == Choice.paper && computerChoice == Choice.rock) ||
        (userChoice == Choice.scissors && computerChoice == Choice.paper)) {
      return "You win!";
    } else {
      return "Computer wins!";
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: RPSGame(),
  ));
}
