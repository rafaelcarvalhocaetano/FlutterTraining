import 'package:bytebank_tdd/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());


class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.purple[700],
            accentColor: Colors.purpleAccent[700],
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.purpleAccent[700],
                textTheme: ButtonTextTheme.primary
            )
        ),
        home: Dashboard()
    );
  }
}