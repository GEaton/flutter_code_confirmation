# code_confirmation

A Code Confirmation plugins with 4 input and numerical keyboard

## Getting Started

Simple example :

```dart
class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CodeConfirmation(),
      ),
    );
  }
}
```
You can configure some style and listen change and complete :

```dart
class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        CodeConfirmation(
        
          // configure input code
          inputCodeTextStyle: TextStyle(fontWeight: FontWeight.bold),
          
          // configure keyboard style
          keyboardButtonBorderColor: Colors.blue,
          keyboardButtonTextStyle: TextStyle(decorationStyle:TextDecorationStyle.double ),
          keyboardIconRemoveColor: Colors.red,
          
          // trigger the value of code when the 4th is set
          onCompleted: (String value) {
            print('-------- print from onComplete MyPage => $value');
          },
          
          // trigger the value of code on each input
          onChanged: (String value) {
            print('-------- print from onChange MyPage => $value');
          },      
        )
      )
    );
  }
}
```

