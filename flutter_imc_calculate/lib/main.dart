import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados!";
    });
  }

  void _calculateImc() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = "Abaixo do peso ${imc.toStringAsPrecision(2)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal ${imc.toStringAsPrecision(2)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso ${imc.toStringAsPrecision(2)}";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obsidade Grau 1 ${imc.toStringAsPrecision(2)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obsidade Grau 2 ${imc.toStringAsPrecision(2)}";
      } else if (imc >= 40) {
        _infoText = "Obsidade Grau 3 ${imc.toStringAsPrecision(2)}";
      }
    });
  }

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
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_outline,
                      size: 100.0, color: Colors.deepOrangeAccent),
                  TextFormField(
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (KG)",
                        labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.orangeAccent, fontSize: 25.0),
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu Peso!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (CM)",
                        labelStyle: TextStyle(color: Colors.deepOrangeAccent)),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.orangeAccent, fontSize: 25.0),
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua Altura!";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: Container(
                        height: 50.0,
                        child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _calculateImc();
                              }
                            },
                            child: Text(
                              "Calcular",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0),
                            ),
                            color: Colors.orange)),
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.orange, fontSize: 25.0),
                  ),
                ],
              ),
            )));
  }
}
