import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 20,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el título de esta tarjeta'),
            subtitle: Text(
                'Yo ya se utilizar las cards y todas las otras hueas porque soy seco y he hecho como 10 cursos de flutter.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              FadeInImage(
                image: NetworkImage(
                    "https://images5.alphacoders.com/950/950383.jpg"),
                placeholder: AssetImage("assets/images/original.gif"),
                height: 300,
                fit: BoxFit.fill,
              ),
              Text("Some dummy text"),
            ],
          ),
        ),
      ),
    );
  }
}
