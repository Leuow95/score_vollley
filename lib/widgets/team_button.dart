import 'package:flutter/material.dart';

class TeamButton extends StatefulWidget {
  final Color color;
  final int points;
  final Function incrementScore;
  final Function decrementScore;
  final String teamName;

  const TeamButton({
    super.key,
    required this.color,
    required this.points,
    required this.teamName,
    required this.incrementScore,
    required this.decrementScore,
  });

  @override
  State<TeamButton> createState() => _TeamButtonState();
}

class _TeamButtonState extends State<TeamButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.teamName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.incrementScore();
            });
          },
          child: Container(
            width: 230,
            height: 200,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                widget.points.toString(),
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            setState(() {
              widget.decrementScore();
            });
          },
          child: Container(
            width: 230,
            height: 50,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "-1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              // child: Icon(
              //   Icons.remove,
              //   size: 50,
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
