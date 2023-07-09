import 'package:flutter/material.dart';

class TeamButton extends StatefulWidget {
  final Color color;
  final int points;
  final Function incrementScore;
  final String teamName;

  const TeamButton({
    super.key,
    required this.color,
    required this.points,
    required this.incrementScore,
    required this.teamName,
  });

  @override
  State<TeamButton> createState() => _TeamButtonState();
}

class _TeamButtonState extends State<TeamButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.incrementScore();
        });
      },
      child: Column(
        children: [
          Text(
            widget.teamName,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 250,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              height: 150,
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
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "-1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              // child: Icon(
              //   Icons.remove,
              //   size: 50,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
