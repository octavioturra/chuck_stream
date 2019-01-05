import "dart:async";
import "package:chuck_streams/models/categories.dart";
import "package:chuck_streams/services/remote.dart" as remote;

class CategoriesManager {
  final Stream<Categories> categories = remote
        .getResource<Categories>("categories", Categories.fromJson)
        .asStream();
}
