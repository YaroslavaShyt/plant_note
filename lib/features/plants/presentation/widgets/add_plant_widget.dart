import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_note/features/plants/data/model/plant_model.dart';
import 'package:plant_note/features/authentication/presentation/widgets/form_fields_column.dart';
import 'package:plant_note/core/app_services.dart';

class AddPlantWidget extends StatelessWidget {
  final void Function(Plant) onSubmit;
  final titleController = TextEditingController();
  final newGrowQuantityController = TextEditingController();
  final readyForSellQuantityController = TextEditingController();
  final personalCollectionQuantityController = TextEditingController();
  final soldQuantityController = TextEditingController();
  final moneyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AddPlantWidget({super.key, required this.onSubmit});


  XFile? pickedImagePersonal;
  XFile? pickedImageSelling;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Нова рослина'),
      content: Form(
        key: formKey,
        child: SizedBox(
          width: 100,
          child: Column(
            children: [
              FormFieldsColumn(
                moneyController: moneyController,
                soldQuantityController: soldQuantityController,
                personalCollectionQuantityController: personalCollectionQuantityController,
                readyForSellQuantityController: readyForSellQuantityController,
                newGrowQuantityController: newGrowQuantityController,
                titleController: titleController,
                pickedImagePersonal: pickedImagePersonal,
                pickedImageSelling: pickedImageSelling,
               ),
              FloatingActionButton(
                onPressed: () async{
                  var photo = await pickImage();
                  pickedImageSelling = photo;
                },
                child: Text('На продаж'),),
              FloatingActionButton(
                  onPressed: () async{
                    var photo =  await pickImage();
                    pickedImagePersonal = photo;
                  },
                  child: Text('Особиста'))
            ],
          )
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Відміна')),
        TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
               onSubmit(
                  Plant(
                      title: titleController.text,
                      imageForSelling: pickedImageSelling!,
                      imagePersonal: pickedImagePersonal!,
                      totalMoney: int.parse(soldQuantityController.text),
                      quantitySold: int.parse(moneyController.text),
                      quantityPersonal:
                          int.parse(personalCollectionQuantityController.text),
                      quantityToSell:
                          int.parse(readyForSellQuantityController.text),
                      quantityToGrow:
                          int.parse(newGrowQuantityController.text)),
                );
              }
            },
            child: const Text('Зберегти'))
      ],
    );
  }
}
