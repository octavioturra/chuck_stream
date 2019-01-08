import 'package:chuck_streams/models/model.dart';

enum EnvelopeState {
  Idle,
  Loading,
  Error,
  Success
}

class Envelope<T extends Model> {
  final EnvelopeState state;
  final T data;

  Envelope({
    this.state,
    this.data,
  });
}