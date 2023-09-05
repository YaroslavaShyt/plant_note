import 'package:plant_note/core/database/database_service.dart';
import 'package:plant_note/features/plants/data/model/plant_model.dart';
import 'package:sqflite/sqflite.dart';

class PlantsDBOperations{
  final plantsTableName = 'plants';


  Future<void> createTablePlants(Database database) async{
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $plantsTableName(
    "id" INTEGER PRIMARY KEY,
    "species_name" TEXT NOT NULL,
    "children_quantity" INTEGER,
    "ready_to_sell_quantity" INTEGER,
    "personal_collection_quantity" INTEGER,
    "sold_quantity" INTEGER,
    "profit" INTEGER,
    "sell_image" TEXT,
    "collection_image" TEXT
    );
    """);
  }

  Future<int> createPlant({
    required String speciesName,
    required int childrenQuantity,
    required int readyToSellQuantity,
    required int personalCollectionQuantity,
    required int soldQuantity,
    required int profit,
    required String sellImage,
    required String collectionImage
  }) async{
    final database = await DatabaseService().database;
    return await database.rawInsert("""
    INSERT INTO $plantsTableName 
    (species_name, children_quantity, ready_to_sell_quantity, personal_collection_quantity, 
    sold_quantity, profit, sell_image, collection_image)
    VALUES (?,?,?,?,?,?,?,?)
    """, [speciesName, childrenQuantity, readyToSellQuantity, personalCollectionQuantity,
      soldQuantity, profit, sellImage, collectionImage]);
  }

  Future<List<Plant>> fetchAllPlants() async{
    final database = await DatabaseService().database;
    final plants = await database.rawQuery(
      """SELECT * FROM $plantsTableName ORDER BY COALESCE(species_name)"""
    );
    return plants.map((plant) => Plant.fromSQFLite(plant)).toList();
  }

  Future<Plant> fetchPlantById({required int id}) async{
    final database = await DatabaseService().database;
    final plant = await database.rawQuery(
      """SELECT * FROM $plantsTableName WHERE id = ?""",
      [id]
    );
    return Plant.fromSQFLite(plant);
  }

  Future<int> updatePlant({
    required int id,
    required String? speciesName,
    required int? childrenQuantity,
    required int? readyToSellQuantity,
    required int? personalCollectionQuantity,
    required int? soldQuantity,
    required int? profit,
    required String? sellImage,
    required String? collectionImage
  }) async{
    final database = await DatabaseService().database;
    return await database.update(
      plantsTableName,
      {
        if(speciesName != null) "species_name" : speciesName,
        if(childrenQuantity != null) "children_quantity" : childrenQuantity,
        if(readyToSellQuantity != null) "ready_to_sell_quantity": readyToSellQuantity,
        if(personalCollectionQuantity != null) "personal_collection_quantity": personalCollectionQuantity,
        if(soldQuantity != null) "sold_quantity" : soldQuantity,
        if(profit != null) "profit": profit,
        if(sellImage != null) "sell_image" : sellImage,
        if(collectionImage != null) "collection_image" : collectionImage
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id]
    );
  }

  Future<void> deletePlant({required int id}) async{
    final database = await DatabaseService().database;
    await database.rawDelete(
      """DELETE FROM $plantsTableName WHERE id = ?""",
      [id]
    );
  }

}