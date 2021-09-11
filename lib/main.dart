import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.page.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Calculadora semana2",
        theme: ThemeData.light(),
        home: HomePage());
  }
}
