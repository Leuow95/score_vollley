import 'package:flutter/material.dart';

import 'package:score_volei/widgets/team_button.dart';

import 'widgets/new_game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstTeam = 0;
  int secondTeam = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TeamButton(
                      color: Colors.grey,
                      points: firstTeam,
                      teamName: "Time A",
                      incrementScore: incrementFirstTeamScore,
                      decrementScore: decrementFirstTeamScore,
                    ),
                    const SizedBox(width: 40),
                    NewGameButton(
                      reset: reset,
                    ),
                    const SizedBox(width: 40),
                    TeamButton(
                      color: Colors.red,
                      points: secondTeam,
                      teamName: "Time B",
                      incrementScore: incrementSecondTeamScore,
                      decrementScore: decrementSecondTeamScore,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  incrementFirstTeamScore() {
    setState(() {
      firstTeam++;
    });
  }

  incrementSecondTeamScore() {
    setState(() {
      secondTeam++;
    });
  }

  decrementFirstTeamScore() {
    setState(() {
      firstTeam--;
    });
  }

  decrementSecondTeamScore() {
    setState(() {
      secondTeam--;
    });
  }

  reset() {
    setState(() {
      firstTeam = 0;
      secondTeam = 0;
    });
  }
}
