import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  String btnText;
  Function onPressed;
  int position;

  BorderButton(
      {required this.btnText, required this.onPressed, required this.position});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ))),
          onPressed: () => onPressed(position),
          child: Text(
            btnText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
