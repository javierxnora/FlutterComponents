import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 0;
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
      onChanged: (valorNuevo) {
        setState(() {
          _valorSlider = valorNuevo;
        });
      },
    );
  }
}
