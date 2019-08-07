import 'dart:async';

import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Color keyboardButtonBorderColor;
  final Color keyboardIconRemoveColor;
  final TextStyle keyboardButtonTextStyle;
  final StreamSink<String> streamSink;

  Keyboard({
    this.keyboardButtonBorderColor,
    this.keyboardIconRemoveColor,
    this.keyboardButtonTextStyle,
    this.streamSink,
  });

  StreamSink<String> get _streamSink => streamSink;

  String codeOutput = "";

  dynamic _addDataToSink(data) {
    /// transform data before injection
    if (data != "-") {
      if (codeOutput.length >= 4) {
        return;
      }
      codeOutput = codeOutput + data;
    } else {
      codeOutput = codeOutput.substring(0, codeOutput.length - 1);
    }

    _streamSink.add(codeOutput);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        rowKeyboard(keyNumbers: <dynamic>['1', '2', '3']),
        rowKeyboard(keyNumbers: <dynamic>['4', '5', '6']),
        rowKeyboard(keyNumbers: <dynamic>['7', '8', '9']),
        rowKeyboard(keyNumbers: <dynamic>[
          FlatButton(
            onPressed: null,
            child: Container(),
          ),
          '0',
          removeButton()
        ]),
      ],
    );
  }

  Widget rowKeyboard({@required List<dynamic> keyNumbers}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        keyNumbers[0] is! String
            ? keyNumbers[0]
            : keyboardRoundButton(keyNumber: keyNumbers[0]),
        keyNumbers[1] is! String
            ? keyNumbers[1]
            : keyboardRoundButton(keyNumber: keyNumbers[1]),
        keyNumbers[2] is! String
            ? keyNumbers[2]
            : keyboardRoundButton(keyNumber: keyNumbers[2]),
      ],
    );
  }

  Widget keyboardRoundButton({@required String keyNumber}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        shape: CircleBorder(
          side: BorderSide(color: keyboardButtonBorderColor),
        ),
        onPressed: () {
          _addDataToSink(keyNumber);
        },
        child: Text(
          keyNumber,
          style: keyboardButtonTextStyle,
        ),
      ),
    );
  }

  Widget removeButton() {
    return FlatButton(
      shape: CircleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      child: Container(
          padding: EdgeInsets.all(15),
          child: Icon(
            Icons.backspace,
            color: keyboardIconRemoveColor,
          )),
      onPressed: () {
        _addDataToSink("-");
      },
    );
  }
}
