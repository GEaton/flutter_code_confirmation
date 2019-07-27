import 'package:flutter/material.dart';

class InputCode extends StatelessWidget {
  final TextStyle textStyle;
  final String inputCode;

  InputCode({this.textStyle, this.inputCode});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(inputCode.length > 0 ? inputCode[0] : "_", style: textStyle),
        Text(inputCode.length > 1 ? inputCode[1] : "_", style: textStyle),
        Text(inputCode.length > 2 ? inputCode[2] : "_", style: textStyle),
        Text(inputCode.length > 3 ? inputCode[3] : "_", style: textStyle),
      ],
    );
  }
}
