import 'package:bytebank_widgets/models/receita.dart';
import 'package:bytebank_widgets/screens/details.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return _home();
  }

  Widget _home() {
    return Scaffold(
      backgroundColor: Colors.red,
        body: SizedBox(
            child: FutureBuilder(
              future: DefaultAssetBundle
                  .of(context)
                  .loadString('images/receitas.json'),
              builder: (context, snapshot) {
                List<dynamic> receitas = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Receita receita = Receita.fromJson(receitas[index]);
                    return _card(receita);
                  },
                  itemCount: receitas == null ? 0 : receitas.length,
                );
              },
            ),
        ),
        appBar: _appBar('iFood')
    );
  }

  Widget _card(receita) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (x) => Details(receita),
          ),
        );
      },
      child: SizedBox(
        height: 300,
        child: Card(
            margin: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    _imageCard(receita.foto),
                    _gradient(),
                    _textCard(receita.titulo)
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }

  Widget _imageCard(String img) {
    return Image.asset(
      img,
      fit: BoxFit.fill,
      height: 238,
    );
  }

  Widget _textCard(String text) {
    return Positioned(
        bottom: 10.0,
        left: 10.0,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20))
    );
  }

  Widget _gradient() {
    return Container(
        height: 238, decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.deepOrange.withOpacity(0.7)
            ]
        ),
      ),
    );
  }

  Widget _appBar(String txt) {
    return AppBar(title: Text(txt));
  }
}