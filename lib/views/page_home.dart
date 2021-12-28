import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String output = "0";

  String _out = "0";
  double numero1 = 0.0;
  double numero2 = 0.0;
  String operador = "";

  // ignore: non_constant_identifier_names
  BotonPresionado(String btnVal) {
    if (btnVal == "C") {
      _out = "0";
      numero1 = 0.0;
      numero2 = 0.0;
      operador = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      numero1 = double.parse(output);
      operador = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      numero2 = double.parse(output);
      if (operador == "+") {
        _out = (numero2 + numero1).toString();
      }
      if (operador == "-") {
        _out = (numero1 - numero2).toString();
      }
      if (operador == "*") {
        _out = (numero2 * numero1).toString();
      }
      if (operador == "/") {
        _out = (numero1 / numero2).toString();
      }
      numero1 = 0.0;
      numero2 = 0.0;
      //_out = "0";
    } else {
      _out = _out + btnVal;
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget buildButton(String ButtonVal) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[500]!,
              offset: const Offset(2.0, 2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-2.0, -2.0),
              blurRadius: 8.0,
              spreadRadius: 1.0),
        ],
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          ButtonVal,
          style: const TextStyle(fontSize: 22.0),
        ),
        onPressed: () => BotonPresionado(ButtonVal),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              _PantallResultado(output: output),
              const Expanded(
                child: Divider(),
              ),
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("C"),
                      buildButton("<-"),
                      buildButton("*")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("0"),
                      buildButton("="),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class _PantallResultado extends StatelessWidget {
  const _PantallResultado({
    Key? key,
    required this.output,
  }) : super(key: key);

  final String output;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500]!,
                offset: const Offset(2.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0, -2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0),
          ],
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
        child: Text(
          output,
          style: const TextStyle(fontSize: 60.0),
        ));
  }
}
