import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plant_note/widgets/add_plant_widget.dart';
import 'package:redux/redux.dart';
import '../model/plant_model.dart';
import '../redux/actions.dart';
import '../redux/state.dart';
import 'dart:io';
class PlantListPage extends StatelessWidget {
  const PlantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(FetchAllPlantsAction([]));
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Список рослин'),
          ),
          body: ListView.builder(
            itemCount: viewModel.plants.length,
            itemBuilder: (context, index) {
              final plant = viewModel.plants[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(plant.title),
                    trailing:
                        IconButton(
                          onPressed: () {
                            StoreProvider.of<AppState>(context)
                                .dispatch(DeletePlantAction(plant.id));
                          },
                          icon: const Icon(Icons.delete),
                        ),
                  ),
                  Image.file(File(plant.imagePersonal))
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
                        StoreProvider.of<AppState>(context).dispatch(AddPlantAction(plant));
                        Navigator.of(context).pop();
                        StoreProvider.of<AppState>(context).dispatch(FetchAllPlantsAction([]));
                      }));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final List<Plant> plants;

  _ViewModel({
    required this.plants,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      plants: store.state.plants,
    );
  }
}
