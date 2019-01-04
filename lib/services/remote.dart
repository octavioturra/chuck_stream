import "package:http/http.dart" as http;
import "dart:convert";

import "package:points_rx/models/categories.dart";
import "package:points_rx/models/joke.dart";

class HttpError extends Error {
  final int statusCode;
  HttpError(this.statusCode) : super();
}

Future<http.Response> handleError(http.Response response) async {
  if (response.statusCode >= 200 && response.statusCode < 400) {
    return response;
  }
  throw new HttpError(response.statusCode);
}

typedef Object Handler(Object o);

const String defaultEndpoint = "https://api.chucknorris.io/jokes";

Future<T> getResource<T>(String resource, Handler handler, { String endpoint = defaultEndpoint }) => http
  .get("$endpoint/$resource")
  .then(handleError)
  .then((v) => json.decode(v.body))
  .then(handler);

Stream<Categories> fetchCategories() => http
  .get("https://api.chucknorris.io/jokes/categories")
  .then(handleError)
  .then((v) => json.decode(v.body))
  .then((c) =>  Categories.fromJson(c))
  .asStream();

Stream<Joke> fetchJoke(String category) => http
  .get("https://api.chucknorris.io/jokes/random?category=$category")
  .then(handleError)
  .then((v) => json.decode(v.body))
  .then((j) => Joke.fromJson(j))
  .asStream();