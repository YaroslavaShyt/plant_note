import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final List<FilteringTextInputFormatter> formatters;

  const InputTextFormField(
      {super.key,
      required this.controller,
      required this.title,
      required this.formatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(hintText: title),
        validator: (value) => value != null && value.isEmpty
            ? '$title - обов\'язковий параметр!'
            : null,
        inputFormatters: formatters);
  }
}
