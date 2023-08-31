import 'package:redux/redux.dart';
import 'package:plant_note/redux/actions.dart';
import 'package:plant_note/redux/state.dart';
import 'package:plant_note/database/plants_db.dart';

Middleware<AppState> createFetchPlantsMiddleware(PlantsDB plantsDB) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is FetchAllPlantsAction) {
      final plants = await plantsDB.fetchAll();
      store.dispatch(FetchAllPlantsAction(plants));
    }
    next(action);
  };
}

Middleware<AppState> createFetchPlantByIdMiddleware(PlantsDB plantsDB) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is FetchPlantByIdAction) {
      final plants = await plantsDB.fetchById(action.plantId);
      store.dispatch(FetchAllPlantsAction([plants]));
    }
    next(action);
  };
}


Middleware<AppState> createDeletePlantActionMiddleware(PlantsDB plantsDB) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is DeletePlantAction) {
      await plantsDB.delete(action.plantId);
      final plants = await plantsDB.fetchAll();
      store.dispatch(FetchAllPlantsAction(plants));
    }
    next(action);
  };
}

Middleware<AppState> createAddPlantActionMiddleware(PlantsDB plantsDB) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    if (action is AddPlantAction) {
      await plantsDB.create(
          title: action.plant.title,
          quantityToGrow: action.plant.quantityToGrow,
          quantityToSell: action.plant.quantityToSell,
          quantityPersonal: action.plant.quantityPersonal,
          quantitySold: action.plant.quantitySold,
          totalMoney: action.plant.totalMoney,
          imagePersonal: action.plant.imagePersonal.path,
          imageForSelling: action.plant.imageForSelling.path);
      final plants = await plantsDB.fetchAll();
      store.dispatch(FetchAllPlantsAction(plants));
    }
    next(action);
  };
}