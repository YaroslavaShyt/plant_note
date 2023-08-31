import 'package:plant_note/model/plant_model.dart';
import 'package:sqflite/sqflite.dart';
import 'database_service.dart';

class PlantsDB {
  final tableName = 'plants';

  Future<void> createTable(Database database) async {
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $tableName(
    "id" INTEGER PRIMARY KEY,
    "title" TEXT NOT NULL,
    "quantity_to_grow" INTEGER,
    "quantity_to_sell" INTEGER,
    "quantity_personal" INTEGER,
    "quantity_sold" INTEGER,
    "total_money" INTEGER,
    "image_personal" STRING, 
    "image_for_selling" STRING);
    """);
  }

  Future<int> create(
      {required String title,
      required int quantityToGrow,
      required int quantityToSell,
      required int quantityPersonal,
      required int quantitySold,
      required int totalMoney,
      required imagePersonal,
      required imageForSelling}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
        '''
      INSERT INTO $tableName 
      (title,quantity_to_grow,quantity_to_sell,quantity_personal,
      quantity_sold,total_money,image_personal,image_for_selling) 
      VALUES (?,?,?,?,?,?,?,?)
      ''', [
      title,
      quantityToGrow,
      quantityToSell,
      quantityPersonal,
      quantitySold,
      totalMoney,
      imagePersonal,
      imageForSelling
    ]);
  }

  Future<List<Plant>> fetchAll() async {
    final database = await DatabaseService().database;
    final plants = await database.rawQuery(
      '''
      SELECT * FROM $tableName ORDER BY title
      ''',
    );
    return plants.map((plant) => Plant.fromSQFLiteDataBase(plant)).toList();
  }

  Future<Plant> fetchById(int id) async {
    final database = await DatabaseService().database;
    final plant = await database.rawQuery(
        '''
        SELECT * FROM $tableName WHERE id = ?
        ''', [id]);
    return Plant.fromSQFLiteDataBase(plant.first);
  }

  Future<int> update(
      {required int id,
      required String title,
      required String imageForSelling,
      required String imagePersonal,
      required int totalMoney,
      required int quantitySold,
      required int quantityPersonal,
      required int quantityToSell,
      required int quantityToGrow}) async {
    final database = await DatabaseService().database;
    return await database.update(
        tableName,
        {
          'title': title,
          "quantity_to_grow": quantityToGrow,
          "quantity_to_sell": quantityToSell,
          "quantity_personal": quantityPersonal,
          "quantity_sold": quantitySold,
          "total_money": totalMoney,
          "image_personal": imagePersonal,
          "image_for_selling": imageForSelling
        },
        where: 'id = ?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete(
        '''
        DELETE FROM $tableName WHERE id = ?
        ''', [id]);
  }
}
