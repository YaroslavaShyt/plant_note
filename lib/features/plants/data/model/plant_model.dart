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

  factory Plant.fromSQFLite(Map<String, dynamic> data) {
    return Plant(
      id: data['id'],
      title: data['title'],
      imageForSelling: data['image_for_selling'],
      imagePersonal: data['image_personal'],
      totalMoney: data['total_money'],
      quantitySold: data['quantity_sold'],
      quantityPersonal: data['quantity_personal'],
      quantityToSell: data['quantity_to_sell'],
      quantityToGrow: data['quantity_to_grow'],
    );
  }

}