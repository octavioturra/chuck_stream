import 'package:flutter/material.dart';

class DefaultLoader extends StatelessWidget {
  final String message;

  DefaultLoader({this.message: "Carregando..."});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
            padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0)),
        Container(
          child: Center(
            child: Text(message),
          ),
          padding: EdgeInsets.all(20.0),
        ),
      ],
    ));
  }
}
