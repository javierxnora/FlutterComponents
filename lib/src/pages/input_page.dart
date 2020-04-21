import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
          SizedBox(height: 20),
          _crearDropDown(),
        ],
      ),
    );
  }

  /// Input Nombre
  String _nombre = "Javier Quinteros";
  int _countNombre = 0;

  Widget _crearInput() {
    return TextField(
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

  /// Input Correo
  String _correo = "javier@nora.cl";
  int _countCorreo = 0;

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
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

  /// Input Password
  String _password = "********";
  int _countPassword = 0;

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
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

  /// Input DatePicker
  String _fecha = "";
  TextEditingController _datePickerController = TextEditingController();

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

  /// DropdownMenu
  String _opcionSeleccionada = 'Volar';

  List _poderes = ['Volar', 'Rayos X', 'Aliento de Hielo', 'Super Fuerza'];

  List<DropdownMenuItem<String>> getOpcionesPoderes() {
    List<DropdownMenuItem<String>> listaPoderes = List();

    _poderes.forEach(
      (poder) {
        listaPoderes.add(
          DropdownMenuItem(
            child: Text(poder),
            value: poder,
          ),
        );
      },
    );

    return listaPoderes;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30),
        DropdownButton(
          items: getOpcionesPoderes(),
          value: _opcionSeleccionada,
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        ),
      ],
    );
  }
}
