import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CircleAvatar(
              child: Text("JQ"),
            ),
          ),
        ],
      ),
    );
  }
}
