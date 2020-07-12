import 'dart:async';

import 'package:estufinha_app/green_house/greenhouse_repository.dart';

import 'greenhouse_event.dart';
import 'greenhouse_model.dart';

class GreenHouseBLOC {
  //Database Repository
  final _repository = GreenHouseRepository();

  // init and get StreamController
  final _streamController = StreamController<GreenHouse>();

  StreamSink<GreenHouse> get streamSink => _streamController.sink;

  // expose data from stream
  Stream<GreenHouse> get streamController => _streamController.stream;

  final _eventController = StreamController<GreenHouseEvent>();

  // expose sink for input events
  StreamSink<GreenHouseEvent> get eventSink => _eventController.sink;

  //Stream
  StreamSubscription _subscription;

  GreenHouseBLOC() {
    _repository.get().listen((event) {
      _subscription?.cancel();
      _subscription = _repository.get().listen((event) {
        _streamController.add(GreenHouse.fromSnapshot(event.snapshot));
      });
    });

    _eventController.stream.listen(_mapEventToState);
  }

  _mapEventToState(GreenHouseEvent event) {
    if (event is UpdateGreenHouse) {
       _mapUpdateToState(event);
    } else if (event is GetGreenHouse) {
       _mapGetToState(event);
    }
  }

  _mapGetToState(GetGreenHouse event) async {}

  _mapUpdateToState(UpdateGreenHouse event) async {
    await _repository.update(event.greenHouse);
  }

  dispose() {
    _subscription.cancel();
    _eventController.close();
    _streamController.close();
  }
}
