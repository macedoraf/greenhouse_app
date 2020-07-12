import 'dart:async';

abstract class BaseBloc<TypeModel, TypeEvent> {
  final _streamController = StreamController<TypeModel>();

  StreamSink<TypeModel> get streamSink => _streamController.sink;

  Stream<TypeModel> get streamController => _streamController.stream;
  final _eventController = StreamController<TypeEvent>();

  StreamSink<TypeEvent> get eventSink => _eventController.sink;
  StreamSubscription _subscription;

  BaseBloc() {
    _eventController.stream.listen(mapEventToState);
  }

  mapEventToState(TypeEvent event);

  dispose() {
    _streamController.close();
    _eventController.close();
    _subscription.cancel();
  }
}
