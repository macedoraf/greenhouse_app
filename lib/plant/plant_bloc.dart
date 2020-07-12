import 'dart:async';

import 'package:estufinha_app/plant/plant_event.dart';
import 'package:estufinha_app/plant/plant_model.dart';
import 'package:estufinha_app/plant/plant_state.dart';

class PlantBLOC {
  // init and get StreamController
  final _streamController = StreamController<PlantState>();

  StreamSink<PlantState> get streamSink => _streamController.sink;

  // expose data from stream
  Stream<PlantState> get streamController => _streamController.stream;

  final _eventController = StreamController<PlantEvent>();

  // expose sink for input events
  StreamSink<PlantEvent> get eventSink => _eventController.sink;

  //Stream
  StreamSubscription _subscription;

  PlantBLOC() {
    _eventController.stream.listen(_mapEventToState);
    _streamController.add(PlantStateSuccess([Plant("Planta 1"),Plant("Planta 2")]));
  }

  _mapEventToState(PlantEvent event) {}

  dispose() {
    _subscription.cancel();
    _eventController.close();
    _streamController.close();
  }
}
