import 'package:flutter/material.dart';
import 'package:plant_note/features/plants/presentation/widgets/add_plant_widget.dart';

import 'dart:io';
class PlantListPage extends StatelessWidget {
  const PlantListPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Список рослин'),
          ),
          body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text('test'),
                    trailing:
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.delete),
                        ),
                  ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(context: context,
                  builder: (context)=>
                      AddPlantWidget(
                      onSubmit: (plant){

                      }));
            },
            child: const Icon(Icons.add),
          ),
        );
  }
}

