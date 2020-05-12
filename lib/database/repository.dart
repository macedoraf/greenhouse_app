import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class Repository {
  final FirebaseDatabase _database = FirebaseDatabase.instance;


  StreamSubscription subscribeOnStateChange(void onListen(Event event)) {
    DatabaseReference _stateQuery = _database.reference().child("state");
    return _stateQuery.onValue.listen(onListen);
  }

}
