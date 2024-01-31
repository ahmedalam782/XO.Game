import 'package:flutter/material.dart';

import 'constant.dart';

void showAlertDialog(BuildContext context,
    {required String titleText, required String playerSymbol}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titleText),
        content: Image.network(
          'https://media.giphy.com/media/artj92V8o75VPL7AeQ/giphy.gif',
          fit: BoxFit.fill,
          width: 200,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetBorder();
              player1Score = 0;
              player2Score = 0;
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              resetBorder();
              if (playerSymbol == 'X') {
                player1Score += 5;
              } else {
                player2Score += 5;
              }
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}

void resetBorder() {
  borderState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  count = 0;
}
