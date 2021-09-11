import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageStage();
}

//esta clase tiene el estado de la pagina principal
class _HomePageStage extends State<HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(children: <Widget>[
        Expanded(
            flex: 5,
            child: Container(
              child: Text("Zona resultados"),
              color: Colors.blue,
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Text("Zona ingreso"),
              color: Colors.red,
            )),
        Expanded(
            flex: 2,
            child: Container(
              child: Text("Zona botones"),
              color: Colors.green,
            )),
      ]),
    );
  }
}
