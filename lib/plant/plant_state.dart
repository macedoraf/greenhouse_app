import 'package:estufinha_app/plant/plant_model.dart';

abstract class PlantState {
  const PlantState();
}

class PlantStateLoading extends PlantState {}

class PlantStateSuccess extends PlantState {
  final List<Plant> plants;

  PlantStateSuccess([this.plants = const []]);
}
