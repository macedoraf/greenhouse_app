import 'package:estufinha_app/app/myapp.dart';
import 'package:estufinha_app/plant/add_play_dialog.dart';
import 'package:estufinha_app/plant/plant_bloc.dart';
import 'package:estufinha_app/plant/plant_model.dart';
import 'package:estufinha_app/plant/plant_state.dart';
import 'package:flutter/material.dart';

class PlantPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlantPageState();
}

class PlantPageState extends State<PlantPage> {
  final _bloc = PlantBLOC();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.streamController,
        builder: (BuildContext context, AsyncSnapshot<PlantState> snapshot) {
          switch (snapshot.data.runtimeType) {
            case PlantStateSuccess:
              return _successState(snapshot.data);
            default:
              return _errorState();
          }
        });
  }

  _successState(PlantStateSuccess state) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(context: context, builder: (_) => AddPlantDialog());
          },
        ),
        body: ListView.builder(
            itemCount: state.plants.length,
            itemBuilder: (BuildContext context, int index) {
              return _makeElement(state.plants[index]);
            }));
  }

  _errorState() {
    return Container();
  }

  Widget _makeElement(Plant plant) {
    return Card(
      elevation: 8,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: secondaryColor),
        child: _makeCardContent(plant.name),
      ),
    );
  }

  Widget _makeCardContent(String name) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: lightColor))),
          child: Icon(Icons.autorenew, color: lightColor),
        ),
        title: Text(
          name,
          style: TextStyle(color: lightColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" Intermediate", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }
}
