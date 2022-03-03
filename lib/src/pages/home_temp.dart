import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ["uno", "dos", "tres", "cuatro", "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Componentes Temp"),
      ),
      body: ListView(children: _crearItemCorta()),
    );
  }

  List<Widget> _crearItem() {
    List<Widget> lista = <Widget>[];
    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + "!"),
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
