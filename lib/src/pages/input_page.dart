import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "Javier Quinteros";
  int _countNombre = 0;

  String _correo = "javier@nora.cl";
  int _countCorreo = 0;

  String _password = "********";
  int _countPassword = 0;

  String _fecha = "";
  TextEditingController _datePickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs de Texto"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          SizedBox(height: 20),
          _crearEmail(),
          SizedBox(height: 20),
          _crearPassword(),
          SizedBox(height: 20),
          _crearFecha(context),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        counter: Text("Letras $_countNombre"),
        hintText: "Introduzca su nombre.",
        labelText: "Nombre",
        helperText: "Ej: $_nombre",
        suffixIcon: Icon(Icons.recent_actors),
        icon: Icon(Icons.person),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
          _countNombre = valor.length;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        counter: Text("Letras $_countCorreo"),
        hintText: "Introduzca su correo electrónico.",
        labelText: "Correo",
        helperText: "Ej: $_correo",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _correo = valor;
          _countCorreo = valor.length;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        counter: Text("Letras $_countPassword"),
        hintText: "Introduzca su contraseña.",
        labelText: "Contraseña",
        helperText: "Ej: $_password",
        suffixIcon: Icon(Icons.visibility_off),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
          _countPassword = valor.length;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _datePickerController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "Introduzca su fecha de nacimiento.",
        labelText: "Fecha de nacimiento",
        helperText: "Ej: $_fecha",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _pickDate(context);
      },
    );
  }

  _pickDate(BuildContext context) async {
    DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(3000),
      locale: Locale('es'),
    );

    if (pickedDate != null) {
      setState(() {
        _fecha = pickedDate.toString();
        _datePickerController.text =
            DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }
}
