import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'greenhouse_state_bloc.dart';
import 'greenhouse_state_event.dart';
import 'greenhouse_state_model.dart';

class GreenHousePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GreenHousePageState();
}

class GreenHousePageState extends State<GreenHousePage> {
  final bloc = GreenHouseBLOC();

  @override
  void initState() {
    super.initState();
    bloc.eventSink.add(GetGreenHouse());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: StreamBuilder<GreenHouse>(
            stream: bloc.streamController,
            builder:
                (BuildContext context, AsyncSnapshot<GreenHouse> snapshot) {
              if (snapshot.hasData) {
                var _greenHouseModel = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Temperatura:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(_greenHouseModel.temperatura.toString(),
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
                          _greenHouseModel.umidade.toString(),
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
                        CupertinoSwitch(
                          value: _greenHouseModel.exaustor,
                          onChanged: (bool) {
                            _greenHouseModel.exaustor = bool;
                            bloc.eventSink
                                .add(UpdateGreenHouse(_greenHouseModel));
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Irrigador:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        CupertinoSwitch(
                          value: _greenHouseModel.irrigador,
                          onChanged: (bool) {
                            _greenHouseModel.irrigador = bool;
                            bloc.eventSink
                                .add(UpdateGreenHouse(_greenHouseModel));
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Luz:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        CupertinoSwitch(
                          value: _greenHouseModel.luz,
                          onChanged: (bool) {
                            _greenHouseModel.luz = bool;
                            bloc.eventSink
                                .add(UpdateGreenHouse(_greenHouseModel));
                          },
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
