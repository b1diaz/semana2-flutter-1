import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageStage();
}

class _HomePageStage extends State<HomePage> {
  String cadenaOperaciones = "";
  String valorResultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          this.zonaResultados(),
          this.zonaOperaciones(),
          this.tecladoNumerico()
        ],
      ),
    );
  }

  Widget tecladoNumerico() {
    return Expanded(
        flex: 2,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  pintarBoton(
                    texto: "7",
                  ),
                  pintarBoton(texto: "8"),
                  pintarBoton(texto: "9"),
                  pintarBoton(texto: "÷", equivalente: "/"),
                  pintarBoton(texto: "<="),
                  pintarBoton(texto: "C"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  pintarBoton(texto: "4"),
                  pintarBoton(texto: "5"),
                  pintarBoton(texto: "6"),
                  pintarBoton(texto: "*"),
                  pintarBoton(texto: "("),
                  pintarBoton(texto: ")"),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                pintarBoton(texto: "1"),
                pintarBoton(texto: "2"),
                pintarBoton(texto: "3"),
                pintarBoton(texto: "-"),
                pintarBoton(texto: "X²", equivalente: "^2"),
                pintarBoton(texto: "√", equivalente: "sqrt("),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                pintarBoton(texto: "0"),
                pintarBoton(texto: "."),
                pintarBoton(texto: "%"),
                pintarBoton(texto: "+"),
                pintarBotonVerde(texto: "=", flex: 2),
              ]),
            ],
          ),
        ));
  }

  void agregarOperacion(String valor, String? equivalente) {
    setState(() {
      try {
        if (equivalente != null) {
          valor = equivalente;
        }

        String ultimoCaracter = valor;
        if (cadenaOperaciones.length > 0) {
          ultimoCaracter =
              cadenaOperaciones.substring(cadenaOperaciones.length - 1);

          if (esOperador(ultimoCaracter) && esOperador(valor)) {
            cadenaOperaciones =
                cadenaOperaciones.substring(0, cadenaOperaciones.length - 1);
            cadenaOperaciones += valor;
            return;
          }
        }

        switch (valor) {
          case "<=":
            borrarNumero();
            break;
          case "C":
            cadenaOperaciones = "";
            valorResultado = "";
            break;
          case "sqrt(":
            if (esOperador(ultimoCaracter) == false) {
              valor = "*sqrt(";
              cadenaOperaciones += valor;
            }
            break;
          case "%":
            List<String> lista = cadenaOperaciones.split(RegExp(r"[+\-*/]"));
            if (lista.length > 1) {
              int ultimo = int.parse(lista.last);
              valor = (ultimo / 100).toString();

              cadenaOperaciones = cadenaOperaciones.substring(
                  0, cadenaOperaciones.length - lista.last.length);
              cadenaOperaciones += valor;
            } else {
              valor = (int.parse(cadenaOperaciones) / 100).toString();
              cadenaOperaciones = valor;
            }

            break;
          case "=":
            if (cadenaOperaciones.length > 0) {
              Parser p = new Parser();
              print(cadenaOperaciones);
              Expression exp = p.parse(cadenaOperaciones);
              print("Impriendo exp $exp");
              String result =
                  exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
              print(result);
              valorResultado = "$cadenaOperaciones = $result";
              cadenaOperaciones = result;
            } else {
              valorResultado = "0";
            }

            break;
          default:
            cadenaOperaciones += valor;
        }
      } catch (e) {
        valorResultado = "Error";
      }
    });
  }

  Widget zonaOperaciones() {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.grey[800],
          margin: EdgeInsets.fromLTRB(0, 0, 0, 4.0),
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(cadenaOperaciones),
            ],
          ),
        ));
  }

  Widget zonaResultados() {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.grey[800],
          margin: EdgeInsets.fromLTRB(0, 0, 0, 6.0),
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(valorResultado),
            ],
          ),
        ));
  }

  Widget pintarBoton(
      {required String texto, int flex = 1, String? equivalente}) {
    return Expanded(
        flex: flex,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
              onPressed: () => agregarOperacion(texto, equivalente),
              child: Text(texto),
            ),
          ),
        ));
  }

  Widget pintarBotonVerde(
      {required String texto, int flex = 1, String? equivalente}) {
    return Expanded(
        flex: flex,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () => agregarOperacion(texto, equivalente),
              child: Text(texto),
            ),
          ),
        ));
  }

  void borrarNumero() {
    if (cadenaOperaciones.length > 0) {
      cadenaOperaciones =
          cadenaOperaciones.substring(0, cadenaOperaciones.length - 1);
    }
  }

  bool esOperador(String cadena) {
    List<String> operadores = ["=", "+", "-", "*", "/", "^2", "√"];
    return operadores.contains(cadena);
  }
}
