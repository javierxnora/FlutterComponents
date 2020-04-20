import 'package:flutter/material.dart';
import 'package:componentes/providers/menu_provider.dart';

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
      //initialData: [],
      builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data) {
    List<Widget> listaOpciones = [];

    for (dynamic opt in data) {
      final tempWidget = ListTile(
        leading: Icon(
          Icons.new_releases,
          color: Colors.blue,
        ),
        title: Text(opt['texto']),
        subtitle: Text('Cualquier cosa'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('Lo tocaste');
        },
      );

      listaOpciones.add(tempWidget);
      listaOpciones.add(Divider(color: Colors.blue));
    }

    return listaOpciones;
  }
}
