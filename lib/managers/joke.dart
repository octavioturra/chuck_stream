import "dart:async";
import "package:chuck_streams/models/joke.dart";
import "package:chuck_streams/services/remote.dart" as remote;
import 'package:chuck_streams/models/envelope.dart';

class JokeManager {
  StreamController _controller = new StreamController<Envelope<Joke>>.broadcast();

  Stream<Envelope<Joke>> jokes;

  JokeManager() {
    jokes = _controller.stream;
  }

  void getJoke(String category) async {
    _controller.add(Envelope(state: EnvelopeState.Loading, data: Joke.empty()));

    Stream<Envelope<Joke>> jokeStream = remote
        .getResource<Joke>("random?category=$category", Joke.fromJson)
        .asStream()
        .map((j) => Envelope<Joke>(state: EnvelopeState.Success, data: j));

    await _controller.addStream(jokeStream);
  }
}
