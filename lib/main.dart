import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: Center(
            child: Container(
          child: Text("Hola Mundo"),
        )),
      ),
    );
  }
}
