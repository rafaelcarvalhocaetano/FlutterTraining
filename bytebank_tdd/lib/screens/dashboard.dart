import 'package:bytebank_tdd/dao/contact_dao.dart';
import 'package:bytebank_tdd/screens/contacts_list.dart';
import 'package:bytebank_tdd/screens/transactions_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatelessWidget {


  final ContactDAO contactDAO;

  Dashboard({
    @required this.contactDAO
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[700],
      body: LayoutBuilder(
        builder: (ctx, constrainst) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrainst.maxHeight,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 10,
              height: MediaQuery.of(context).size.height * 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(top: 64.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset('images/nu_fundo.png'),
                        Text('TDD', style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.white
                        ),)
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FeatureItem(
                          'Transfer',
                          Icons.monetization_on,
                          onClick: () => _showContactsList(context),
                        ),
                        FeatureItem(
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
          ),
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

class FeatureItem extends StatelessWidget {

  final String labelText;
  final IconData iconText;
  final Function onClick;

  FeatureItem(this.labelText, this.iconText, {this.onClick});

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

