import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC Calculate"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline,
                  size: 100.0, color: Colors.deepOrangeAccent),
              TextField(
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (KG)",
                    labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orangeAccent, fontSize: 25.0),
              ),
              TextField(
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (CM)",
                    labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orangeAccent, fontSize: 25.0),
              ),
             Padding(
               padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
               child:  Container(
                   height: 50.0,
                   child: RaisedButton(
                       onPressed: () {},
                       child: Text(
                         "Calcular",
                         style: TextStyle(color: Colors.white, fontSize: 25.0),
                       ),
                       color: Colors.orange)),
             ),
              Text(
                "Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange, fontSize: 25.0),
              ),
            ],
          ),
        ));
  }
}
