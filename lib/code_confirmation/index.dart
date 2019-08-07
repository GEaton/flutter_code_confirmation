import 'dart:async';

import 'package:flutter/material.dart';

import 'keyboard.dart';
import 'input_code.dart';
import 'default_config.dart';

class CodeConfirmation extends StatefulWidget {
  @override
  _CodeConfirmationState createState() => _CodeConfirmationState();

  final TextStyle inputCodeTextStyle;
  final TextStyle keyboardButtonTextStyle;
  final Color keyboardButtonBorderColor;
  final Color keyboardIconRemoveColor;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;

  CodeConfirmation({
    this.inputCodeTextStyle = Configuration.inputCodeTextStyle,
    this.keyboardButtonTextStyle = Configuration.keyboardButtonTextStyle,
    this.keyboardButtonBorderColor = Configuration.keyboardButtonBorderColor,
    this.keyboardIconRemoveColor = Configuration.keyboardIconRemoveColor,
    this.onCompleted,
    this.onChanged,
  });
}

class _CodeConfirmationState extends State<CodeConfirmation> {
  StreamController<String> codeConfirmationStream = StreamController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    codeConfirmationStream?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StreamBuilder<String>(
            initialData: '____',
            stream: codeConfirmationStream.stream,
            builder: (context, AsyncSnapshot<String> snapshot) {
              var inputCode = snapshot.data;

              if (widget.onChanged != null) {
                widget.onChanged(inputCode);
              }

              if (widget.onCompleted != null && inputCode.length == 4 && inputCode != '____') {
                widget.onCompleted(inputCode);
              }

              return InputCode(
                inputCode: inputCode,
                textStyle: widget.inputCodeTextStyle,
              );
            }),
        SizedBox(
          height: 30,
        ),
        Keyboard(
          keyboardButtonBorderColor: widget.keyboardButtonBorderColor,
          keyboardIconRemoveColor: widget.keyboardIconRemoveColor,
          keyboardButtonTextStyle: widget.keyboardButtonTextStyle,
          streamSink: codeConfirmationStream.sink,
        ),
      ],
    );
  }
}
