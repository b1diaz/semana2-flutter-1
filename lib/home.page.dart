import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semanda2flutter1/widgets/botones.widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageStage();
}

//esta clase tiene el estado de la pagina principal
class _HomePageStage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pintarBoton(texto: "7", metodo: () {}),
                pintarBoton(texto: "8", metodo: () {}),
                pintarBoton(texto: "9", metodo: () {}),
                pintarBoton(texto: "÷", metodo: () {}),
                pintarBoton(texto: "<=", metodo: () {}),
                pintarBoton(texto: "C", metodo: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                pintarBoton(texto: "4", metodo: () {}),
                pintarBoton(texto: "5", metodo: () {}),
                pintarBoton(texto: "6", metodo: () {}),
                pintarBoton(texto: "*", metodo: () {}),
                pintarBoton(texto: "(", metodo: () {}),
                pintarBoton(texto: ")", metodo: () {}),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              pintarBoton(texto: "1", metodo: () {}),
              pintarBoton(texto: "2", metodo: () {}),
              pintarBoton(texto: "3", metodo: () {}),
              pintarBoton(texto: "-", metodo: () {}),
              pintarBoton(texto: "X²", metodo: () {}),
              pintarBoton(texto: "√", metodo: () {}),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              pintarBoton(texto: "0", metodo: () {}),
              pintarBoton(texto: ".", metodo: () {}),
              pintarBoton(texto: "%", metodo: () {}),
              pintarBoton(texto: "+", metodo: () {}),
              pintarBoton(texto: "=", metodo: () {}, flex: 2),
            ]),
          ])),
        ],
      ),
    );
  }
}
