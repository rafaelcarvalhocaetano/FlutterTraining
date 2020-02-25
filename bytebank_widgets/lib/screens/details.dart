import 'package:bytebank_widgets/models/receita.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {

  final Receita receita;

  Details(this.receita);

  @override
  Widget build(BuildContext context) {
    return _details();
  }

  Widget _details() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _imageDetails(receita.foto),
          _textDetails(receita.titulo),
          _lineDetails('${receita.porcoes} porções', receita.tempoPreparo),
          _subTitleDetails('Ingredientes'),
          _txtDetails(receita.ingredientes),
          _subTitleDetails('Modo de preparo'),
          _txtDetails(receita.modoPreparo),
        ],
      ),
    );
  }

  Widget _textDetails(String txt) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16
      ),
      child: Center(
        child: Text(txt, style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 32.0
          ),
        ),
      ),
    );
  }

  Widget _imageDetails(String img) {
    return Image.asset(img);
  }

  Widget _lineDetails(String rends, String tempo) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 32
      ),
      child: Row(
        children: <Widget>[
          _columnIconsDetails(Icons.restaurant, rends),
          _columnIconsDetails(Icons.timer, tempo),
        ],
      ),
    );
  }

  Widget _columnIconsDetails(icone, String txt) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(
            icone,
            color: Colors.deepOrange,
          ),
          Text(
            txt,
            style: TextStyle(
                color: Colors.deepOrange,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  Widget _subTitleDetails(String details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          details,
          style: TextStyle(
              fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
    );
  }

  Widget _txtDetails(String details) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        details,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
