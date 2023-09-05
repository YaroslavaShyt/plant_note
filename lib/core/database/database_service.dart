import 'package:plant_note/features/authentication/data/datasource/users_db_operations.dart';
import 'package:plant_note/features/plants/data/datasource/plants_db_operations.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService{
  Database? _database;

  Future get database async{
    if(_database != null){
      return _database;
    }
    _database = await _initialize();
    return _database;
  }

  Future<String> get fullPath async{
    const name = 'plants.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async{
    final path = await fullPath;
    var database = await openDatabase(
        path,
      version: 1,
      onCreate: create,
      singleInstance: true
    );
    return database;
  }

  Future<void> create(Database database, int version) async{
    await PlantsDBOperations().createTablePlants(database);
    await UsersDBOperations().createTableUsers(database);
  }
}