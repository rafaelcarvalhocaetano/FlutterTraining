import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  AuthDialog extends StatefulWidget {

  final Function(String) onConfirm;

  AuthDialog({
    @required this.onConfirm,
  });

  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _password,
        obscureText: true,
        maxLength: 4,
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
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            widget.onConfirm(_password.text);
            Navigator.pop(context);
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
