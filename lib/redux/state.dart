import 'package:flutter/cupertino.dart';
import 'package:plant_note/model/plant_model.dart';

@immutable
class AppState {
  final List<Plant> plants;

  const AppState({required this.plants});
}
