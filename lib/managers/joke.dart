import "dart:async";
import "package:points_rx/models/joke.dart";
import "package:points_rx/services/remote.dart" as remote;

class JokeManager {
  StreamController _controller = new StreamController<Joke>.broadcast();

  Stream<Joke> jokes;

  JokeManager() {
    jokes = _controller.stream;
  }

  void getJoke(String category) async {
    _controller.add(Joke.empty());

    Stream<Joke> jokeStream = remote
        .getResource<Joke>("random?category=$category", Joke.fromJson)
        .asStream();

    await _controller.addStream(jokeStream);
  }
}
