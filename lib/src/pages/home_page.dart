import 'package:flutter/material.dart';
import 'package:componentes/providers/menu_provider.dart';
import 'package:icons_helper/icons_helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, buildContext),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    List<Widget> listaOpciones = [];

    for (dynamic opt in data) {
      final tempWidget = ListTile(
        leading: Icon(
          getIconGuessFavorMaterial(name: opt['icon']),
          color: Colors.blue,
        ),
        title: Text(opt['texto']),
        subtitle: Text(opt['sub-texto']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      listaOpciones.add(tempWidget);
      listaOpciones.add(Divider(color: Colors.blue));
    }

    return listaOpciones;
  }
}
