import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:plant_note/redux/state.dart';
import 'package:plant_note/redux/reducers.dart';
import 'package:plant_note/redux/middleware.dart';
import 'package:plant_note/database/plants_db.dart';
import 'app.dart';

void main() {
  final plantsDB = PlantsDB();

  final store = Store<AppState>(
    rootReducer,
    initialState: const AppState(plants: []),
    middleware: [
      createFetchPlantsMiddleware(plantsDB),
      createAddPlantActionMiddleware(plantsDB),
      createDeletePlantActionMiddleware(plantsDB),
      createDeletePlantActionMiddleware(plantsDB)
    ],
  );
  runApp(MyApp(store: store));
}
