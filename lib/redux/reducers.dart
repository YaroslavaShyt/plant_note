import 'package:plant_note/redux/state.dart';
import 'package:plant_note/redux/actions.dart';
import 'package:plant_note/model/plant_model.dart';

AppState rootReducer(AppState state, dynamic action) {
  return AppState(
    plants: plantsReducer(state.plants, action),
  );
}

List<Plant> plantsReducer(List<Plant> state, dynamic action) {
  if (action is AddPlantAction) {
    return List.from(state)..add(action.plant);
  } else if (action is DeletePlantAction) {
    return state.where((plant) => plant.id != action.plantId).toList();
  } else if (action is FetchAllPlantsAction) {
    return action.plants;
  } else if (action is FetchPlantByIdAction){
    return [action.plant];
  }
  return state;
}
