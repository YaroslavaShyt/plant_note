import 'package:flutter/material.dart';

class LogInFormField extends StatelessWidget {
  final String title;
  final GlobalKey fieldKey;
  const LogInFormField({super.key, required this.title, required this.fieldKey});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      key: fieldKey,
        decoration: InputDecoration(
            hintText: title
        ),
        validator: (val){
          if (val == null || val.isEmpty) {
            return 'Введіть $title!';
          } else if (val.contains(' ')) {
            return '$title не може містити пробілів';
          }
        }
    );
  }
}
