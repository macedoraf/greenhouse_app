import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

import 'greenhouse_state_model.dart';

class GreenHouseRepository {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  update(GreenHouse object) {
    DatabaseReference _databaseReference = _database.reference().child("state");
    _databaseReference.set(object.toJson());
  }

  Stream<Event> get() {
    Query _stateQuery = _database.reference().child("state");
    return _stateQuery.onValue;
  }
}
