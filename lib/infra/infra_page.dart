import 'dart:async';

import 'package:estufinha_app/database/repository.dart';
import 'package:estufinha_app/infra/model/estufa_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfraPageState();
}

class InfraPageState extends State<InfraPage> {
  final repo = Repository();
  var model = EstufaModel(false, false, false, 0, 0);
  StreamSubscription subscription;

  onFirebaseEvent(Event event) async {
    setState(() {
      this.model = EstufaModel.fromSnapshot(event.snapshot);
    });
  }

  subscribeState() {
    subscription = repo.subscribeOnStateChange(onFirebaseEvent);
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    subscribeState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Temperatura:",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(model.temperatura.toString(),
                  style: TextStyle(fontSize: 20.0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Umidade:",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                model.umidade.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Exaustor:",
                style: TextStyle(fontSize: 20.0),
              ),
              CupertinoSwitch(value: model.exaustor)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Irrigador:",
                style: TextStyle(fontSize: 20.0),
              ),
              CupertinoSwitch(value: model.irrigador),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Luz:",
                style: TextStyle(fontSize: 20.0),
              ),
              CupertinoSwitch(value: model.luz),
            ],
          )
        ],
      ),
    );
  }
}
