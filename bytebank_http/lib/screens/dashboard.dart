import 'package:bytebank_http/screens/contacts_list.dart';
import 'package:bytebank_http/screens/transactions_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: Container(
        width: MediaQuery.of(context).size.width * 10,
        height: MediaQuery.of(context).size.height * 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(top: 64.0),
              child: Image.asset('images/nu_fundo.png'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  _FeatureItem(
                    'Transfer',
                    Icons.monetization_on,
                    onClick: () => _showContactsList(context),
                  ),
                  _FeatureItem(
                    'Transaction Feed',
                    Icons.description,
                    onClick: () => _showTransactionsList(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showContactsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (x) => ContactList(),
      ),
    );
  }

  _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (x) => TransactionsList(),
      )
    );
  }
}

class _FeatureItem extends StatelessWidget {

  final String labelText;
  final IconData iconText;
  final Function onClick;

  _FeatureItem(this.labelText, this.iconText, {this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Material(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10.0),
          child: InkWell(
            onTap: () => onClick(),
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: 150,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    iconText,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    labelText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

