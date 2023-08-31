import 'package:plant_note/model/plant_model.dart';

class AddPlantAction {
  final Plant plant;

  AddPlantAction(this.plant);
}

class DeletePlantAction {
  final int plantId;

  DeletePlantAction(this.plantId);
}

class FetchAllPlantsAction {
  final List<Plant> plants;

  FetchAllPlantsAction(this.plants);
}

class FetchPlantByIdAction{
  final int plantId;
  final Plant plant;

  FetchPlantByIdAction(this.plantId, this.plant);
}