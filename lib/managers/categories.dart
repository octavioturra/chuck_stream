import "dart:async";
import "package:points_rx/models/categories.dart";
import "package:points_rx/services/remote.dart" as remote;

class CategoriesManager {
  final Stream<Categories> categories = remote
        .getResource<Categories>("categories", Categories.fromJson)
        .asStream();
}
