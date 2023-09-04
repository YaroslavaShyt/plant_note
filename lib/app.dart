import 'package:flutter/material.dart';
import 'package:plant_note/features/authentication/presentation/pages/start_page.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plant Note',
        home: StartPage()//PlantListPage(),
      );
  }
}
