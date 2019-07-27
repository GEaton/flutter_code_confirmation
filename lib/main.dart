import 'package:flutter/material.dart';

import 'code_confirmation/index.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Confirmation Test"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          CodeConfirmation(
            onComplete: (value) {
              print('-------- print from onComplete HomePage => $value');
            },
            onChange: (value) {
              print('-------- print from onChange HomePage => $value');
            },
          ),
        ],
      ),
    );
  }
}
