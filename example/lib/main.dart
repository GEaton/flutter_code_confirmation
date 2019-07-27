import 'package:code_confirmation/code_confirmation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CodeConfirmation(
          onCompleted: (String value) {
            print('-------- print from onComplete MyPage => $value');
          },
          onChanged: (String value) {
            print('-------- print from onChange MyPage => $value');
          },
        ),
      ),
    );
  }
}
