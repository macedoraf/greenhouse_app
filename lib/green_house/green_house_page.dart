import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'greenhouse_bloc.dart';
import 'greenhouse_event.dart';
import 'greenhouse_model.dart';

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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(_greenHouseModel.temperatura.toString(),
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Umidade:",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          _greenHouseModel.umidade.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Exaustor:",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Switch(
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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Switch(
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
                        Switch(
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
