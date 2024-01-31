import 'package:flutter/material.dart';
import 'package:x_o_game/border_button.dart';
import 'package:x_o_game/border_header.dart';
import 'package:x_o_game/dialog_border.dart';

import 'constant.dart';

class XOScreen extends StatefulWidget {
  static const String routeName = 'XOScreen';

  XOScreen({super.key});

  @override
  State<XOScreen> createState() => _XOScreenState();
}

class _XOScreenState extends State<XOScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'X-O Game',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BorderHeader(
              player1Score: player1Score,
              player2Score: player2Score,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BorderButton(
                  btnText: borderState[0],
                  onPressed: onClickUser,
                  position: 0,
                ),
                BorderButton(
                  btnText: borderState[1],
                  onPressed: onClickUser,
                  position: 1,
                ),
                BorderButton(
                  btnText: borderState[2],
                  onPressed: onClickUser,
                  position: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BorderButton(
                  btnText: borderState[3],
                  onPressed: onClickUser,
                  position: 3,
                ),
                BorderButton(
                  btnText: borderState[4],
                  onPressed: onClickUser,
                  position: 4,
                ),
                BorderButton(
                  btnText: borderState[5],
                  onPressed: onClickUser,
                  position: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BorderButton(
                  btnText: borderState[6],
                  onPressed: onClickUser,
                  position: 6,
                ),
                BorderButton(
                  btnText: borderState[7],
                  onPressed: onClickUser,
                  position: 7,
                ),
                BorderButton(
                  btnText: borderState[8],
                  onPressed: onClickUser,
                  position: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onClickUser(int position) {
    if (borderState[position].isNotEmpty) {
      return;
    }
    if (count % 2 == 0) {
      borderState[position] = 'X';
      player1Score++;
    } else {
      borderState[position] = 'O';
      player2Score++;
    }
    count++;
    if (checkWinner('X')) {
      showAlertDialog(context,
          titleText:
              'Player X Win Do you want to continue press Yes or get out of game ',
          playerSymbol: 'X');
    } else if (checkWinner('O')) {
      showAlertDialog(context,
          titleText:
              'Player O Win Do you want to continue press Yes or get out of game ',
          playerSymbol: 'O');
    } else if (count == 9) {
      resetBorder();
    }

    setState(() {});
  }

  bool checkWinner(String playerSymbol) {
    for (int i = 0; i < 9; i += 3) {
      if (borderState[i + 0] == playerSymbol &&
          borderState[i + 1] == playerSymbol &&
          borderState[i + 2] == playerSymbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (borderState[i + 0] == playerSymbol &&
          borderState[i + 3] == playerSymbol &&
          borderState[i + 6] == playerSymbol) {
        return true;
      }
    }
    if (borderState[0] == playerSymbol &&
        borderState[4] == playerSymbol &&
        borderState[8] == playerSymbol) {
      return true;
    }
    if (borderState[2] == playerSymbol &&
        borderState[4] == playerSymbol &&
        borderState[6] == playerSymbol) {
      return true;
    }
    return false;
  }
}
