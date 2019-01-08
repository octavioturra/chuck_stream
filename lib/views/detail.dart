import 'package:flutter/material.dart';
import 'package:chuck_streams/models/joke.dart';
import 'package:chuck_streams/managers/joke.dart';
import 'package:chuck_streams/components/streamLoader.dart';
import 'package:chuck_streams/components/defaultLoader.dart';
import 'package:chuck_streams/models/envelope.dart';

class DetailView extends StatelessWidget {
  final String category;
  final JokeManager manager = new JokeManager();

  DetailView(this.category) : super() {
    manager.getJoke(category);
  }

  Widget buildContent(BuildContext context, Joke joke) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
            child: Text(joke.value,
                style: TextStyle(color: Colors.black87, fontSize: 30.0)),
          ))),
          Center(
              child: RaisedButton(
            child: Text("outra"),
            onPressed: () => manager.getJoke(category),
          ))
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.deepPurple[800],
          Colors.lightGreen[700],
          Colors.teal[600],
          Colors.indigo[400],
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Piada em ${this.category}'),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          textTheme: TextTheme(title: TextStyle(color: Colors.black87)),
          iconTheme: IconThemeData(color: Colors.black87),
        ),
        body: StreamBuilder(
            stream: manager.jokes,
            builder: (BuildContext context, AsyncSnapshot<Envelope<Joke>> snapShot) {
              if (snapShot.hasError) {
                return Text("deu ruim...${snapShot.error}");
              }

              if (snapShot.hasData && (snapShot.hasData && snapShot.data.state == EnvelopeState.Loading)) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return StreamLoader(
                snapShot,
                loader: DefaultLoader(message: "Carregando piada de '$category'"),
                child: (snapShot.hasData)
                      ? buildContent(context, snapShot.data.data)
                      : Text("miou...")
              );
            }));
  }
}
