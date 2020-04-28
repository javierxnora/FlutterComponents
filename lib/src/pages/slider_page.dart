import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            Text(
              _valorSlider.toStringAsFixed(0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 0,
      max: 100,
      divisions: 20,
      onChanged: (_bloquearCheck)
          ? null
          : (valorNuevo) {
              setState(() {
                _valorSlider = valorNuevo;
              });
            },
    );
  }

  Widget _crearCheckBox() {
    /* return CheckboxListTile(
      title: Text("Bloquear Checkbox"),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );*/
    return SwitchListTile(
      title: Text("Bloquear Checkbox"),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
}
