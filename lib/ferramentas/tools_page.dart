import 'dart:async';
import 'dart:ffi';

import 'package:estufinha_app/green_house/greenhouse_repository.dart';
import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToolsPageState();
}

class ToolsPageState extends State<ToolsPage> {
  var _exaustorSlider = 0.0;

  @override
  void initState() {
    super.initState();
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
                Text("Exaustor:", style: TextStyle(fontSize: 20)),
                Slider(
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    this.setState(() {
                      _exaustorSlider = value;
                    });
                  },
                  value: _exaustorSlider,
                )
              ],
            )
          ],
        ));
  }
}
