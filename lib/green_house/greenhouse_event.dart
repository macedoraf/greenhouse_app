

import 'greenhouse_model.dart';

abstract class GreenHouseEvent {
  const GreenHouseEvent();
}

class UpdateGreenHouse extends GreenHouseEvent {
  final GreenHouse greenHouse;

  const UpdateGreenHouse(this.greenHouse);

}
class GetGreenHouse extends GreenHouseEvent {}
