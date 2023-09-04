import 'package:image_picker/image_picker.dart';

class Plant{
  final int id;
  final String title;
  final int quantityToGrow;
  final int quantityToSell;
  final int quantityPersonal;
  final int quantitySold;
  final int totalMoney;
  final imagePersonal;
  final imageForSelling;

  Plant({
    this.id = 0,
    required this.title,
    required this.imageForSelling,
    required this.imagePersonal,
    required this.totalMoney,
    required this.quantitySold,
    required this.quantityPersonal,
    required this.quantityToSell,
    required this.quantityToGrow
  });

  factory Plant.fromSQFLiteDataBase(Map<String, dynamic> map) {
    return Plant(
      id: map['id'],
      title: map['title'],
      imageForSelling: map['image_for_selling'],
      imagePersonal: map['image_personal'],
      totalMoney: map['total_money'],
      quantitySold: map['quantity_sold'],
      quantityPersonal: map['quantity_personal'],
      quantityToSell: map['quantity_to_sell'],
      quantityToGrow: map['quantity_to_grow'],
    );
  }

}