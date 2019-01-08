import "dart:async";
import "package:chuck_streams/models/categories.dart";
import "package:chuck_streams/services/remote.dart" as remote;
import 'package:chuck_streams/models/envelope.dart';

class CategoriesManager {
  final Stream<Envelope<Categories>> categories = remote
        .getResource<Categories>("categories", Categories.fromJson)
        .asStream()
        .map((c) => Envelope<Categories>(data: c, state: EnvelopeState.Success));
}
