import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  AurhDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        obscureText: true,
        maxLength: 6,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder()
        ),
        style: TextStyle(
          fontSize: 24,
          letterSpacing: 32
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            print('Cancel');
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            print('Confirm');
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
