import 'package:flutter/material.dart';
import 'package:plant_note/core/app_services.dart';
import 'form_field_widget.dart';
import 'image_picker_widget.dart';

class FormFieldsColumn extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController newGrowQuantityController;
  final TextEditingController readyForSellQuantityController;
  final TextEditingController personalCollectionQuantityController;
  final TextEditingController soldQuantityController;
  final TextEditingController moneyController;
  var pickedImagePersonal;
  var pickedImageSelling;

  FormFieldsColumn({
    super.key,
    required this.moneyController,
    required this.soldQuantityController,
    required this.personalCollectionQuantityController,
    required this.readyForSellQuantityController,
    required this.newGrowQuantityController,
    required this.titleController,
    required this.pickedImagePersonal,
    required this.pickedImageSelling
  });

  @override
  State<FormFieldsColumn> createState() => _FormFieldsColumnState();
}

class _FormFieldsColumnState extends State<FormFieldsColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextFormField(
          controller: widget.titleController,
          title: 'Назва',
          formatters: [textFormatter["lettersOnly"]],
        ),
        InputTextFormField(
            controller: widget.newGrowQuantityController,
            title: 'На вкоріненні',
            formatters: [textFormatter["numbersOnly"]]),
        InputTextFormField(
            controller: widget.readyForSellQuantityController,
            title: 'Готові до продажу',
            formatters: [textFormatter["numbersOnly"]]),
        InputTextFormField(
            controller: widget.personalCollectionQuantityController,
            title: 'Особиста колекція',
            formatters: [textFormatter["numbersOnly"]]),
        InputTextFormField(
            controller: widget.soldQuantityController,
            title: 'Продано',
            formatters: [textFormatter["numbersOnly"]]),
        InputTextFormField(
            controller: widget.moneyController,
            title: 'Виторг',
            formatters: [textFormatter["numbersOnly"]]),

      ],
    );
  }
}
