import 'package:calculadora_app/service/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      output = double.parse(_out).toStringAsFixed(1);
    });
  }

  Widget buildButton(String ButtonVal) {
    return Expanded(child: Consumer<TemaEstado>(
      builder: (context, temaC, child) {
        return Container(
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: (temaC.darkModeG == false)
                ? Colors.grey[300]
                : Color.fromRGBO(17, 19, 32, 1),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                  color: (temaC.darkModeG == false)
                      ? Colors.grey[500]!
                      : Color.fromRGBO(0, 0, 0, 0.1),
                  offset: const Offset(2.0, 2.0),
                  blurRadius: 8.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: (temaC.darkModeG == false)
                      ? Colors.white
                      : Color.fromRGBO(255, 255, 255, 0.1),
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
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TemaEstado>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: (value.darkModeG == false)
                ? Colors.grey[300]
                : Color.fromRGBO(17, 19, 32, 1),
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
                        BotonTema()
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BotonTema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TemaEstado>(
        builder: (context, value, child) {
          return Container(
              padding: const EdgeInsets.all(0.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: (value.darkModeG == false)
                    ? Colors.grey[300]
                    : Color.fromRGBO(17, 19, 32, 1),
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
              child: Consumer<TemaEstado>(
                builder: (context, temaA, child) {
                  return Switch(
                      value: temaA.darkModeG,
                      onChanged: (_) {
                        temaA.darkModeS(!temaA.darkModeG);
                      });
                },
              ));
        },
      ),
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
    return Consumer<TemaEstado>(
      builder: (context, temaP, child) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: (temaP.darkModeG == false)
                  ? Colors.grey[300]
                  : const Color.fromRGBO(26, 29, 49, 1),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                    color: (temaP.darkModeG == false)
                        ? Colors.grey[500]!
                        : const Color.fromRGBO(0, 0, 0, 0.9),
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: (temaP.darkModeG == false)
                        ? Colors.white
                        : const Color.fromRGBO(255, 255, 255, 0.1),
                    offset: const Offset(2.0, -2.0),
                    blurRadius: 8.0,
                    spreadRadius: 1.0),
              ],
            ),
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 60.0,
              ),
            ));
      },
    );
  }
}
