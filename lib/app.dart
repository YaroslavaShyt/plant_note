import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plant_note/pages/plants_page.dart';
import 'package:plant_note/redux/state.dart';
import 'package:redux/redux.dart';


class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: const MaterialApp(
        title: 'Plant Note',
        home: PlantListPage(),
      ),
    );
  }
}
