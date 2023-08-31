import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Map<String, dynamic> textFormatter = {
  'lettersOnly': FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Zа-яА-Я'-.]")),
  'numbersOnly': FilteringTextInputFormatter.digitsOnly
};

Future pickImage() async {
  final ImagePicker picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  return pickedImage;
}