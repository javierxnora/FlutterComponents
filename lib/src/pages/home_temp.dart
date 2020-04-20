import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        leading: Icon(Icons.new_releases),
        title: Text(opt),
        subtitle: Text('Cualquier cosa'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('Lo tocaste');
        },
      );

      lista..add(tempWidget);
      lista.add(
        Divider(
          color: Colors.blue,
        ),
      );
    }

    return lista;
  }

//  List<Widget> _crearItemsCorta() {
//    return opciones.map((item) {
//      return Column(
//        children: <Widget>[
//          ListTile(
//            title: Text(item),
//          ),
//          Divider(
//            color: Colors.blue,
//          )
//        ],
//      );
//    }).toList();
//  }
}
