import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Page"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Mostrar alerta"),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {
            _mostrarAlerta(context);
          },
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("Hiciste Click"),
            content: Text("Felicidades, hiciste click en la alerta!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Aceptar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
