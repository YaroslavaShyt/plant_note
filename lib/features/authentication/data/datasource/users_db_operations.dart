import 'package:plant_note/core/database/database_service.dart';
import 'package:plant_note/features/authentication/data/model/model_user.dart';
import 'package:sqflite/sqflite.dart';

class UsersDBOperations{
  final usersTableName = 'users';

  Future<void> createTableUsers(Database database) async{
    await database.execute("""
    CREATE TABLE IF NOT EXISTS $usersTableName(
    "id" INTEGER PRIMARY KEY,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL
    );
    """);
  }

  Future<int> createUser({required String username, required password}) async{
    final database = await DatabaseService().database;
    return await database.rawInsert(
      """INSERT INTO $usersTableName (username, password) VALUES (?,?)""",
      [username, password]
    );
  }

  Future<List<User>> fetchAllUsers() async{
    final database = await DatabaseService().database;
    final users = await database.raqQuery(
      """SELECT * FROM $usersTableName ORDER BY COALESCE(username)"""
    );
    return users.map((user) => User.fromSQFLite(user)).toList();
  }

  Future<User> fetchUser({required int id}) async{
    final database = await DatabaseService().database;
    final user = await database.rawQuery(
      """SELECT * FROM $usersTableName WHERE id = ?""",
      [id]
    );
    return User.fromSQFLite(user);
  }

  Future<int> updateUser({
    required int id,
    required String? username,
    required String? password
  }) async{
    final database = await DatabaseService().database;
    return await database.update(
      usersTableName,
      {
        if(username != null) 'username': username,
        if(password != null) 'password': password
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id]
    );
  }

  Future<void> deleteUser({required int id}) async{
    final database = await DatabaseService().database;
    await database.rawDelete(
      """DELETE FROM $usersTableName WHERE id = ?""",
      [id]
    );
  }
}