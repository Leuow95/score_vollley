import 'package:flutter/material.dart';

class NewGameButton extends StatelessWidget {
  final Function reset;

  const NewGameButton({
    Key? key,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.restore,
          size: 36,
        ),
        color: Colors.white,
        onPressed: () => reset());
  }
}
