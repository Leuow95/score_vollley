import 'package:flutter/material.dart';

import 'package:score_volei/widgets/team_button.dart';

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
          color: Colors.grey,
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
                      color: Colors.blue,
                      points: firstTeam,
                      incrementScore: incrementFirstTeamScore,
                      teamName: "Time A",
                    ),
                    const SizedBox(width: 50),
                    TeamButton(
                      color: Colors.red,
                      points: secondTeam,
                      incrementScore: incrementSecondTeamScore,
                      teamName: "Time B",
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
}
