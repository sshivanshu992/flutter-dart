import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_models.dart';

class MyDatabase {
  //? Creating the SingleTon instance for the NotesDatabase class
  static final MyDatabase instance = MyDatabase._init();
  MyDatabase._init();

  //? Defines a Database private variable
  static Database? _database;

  //?Method to initialize the database
  Future<Database> _initializeDB(String filePath) async {
    //? Returns the Database path based on the Platform i.e. Android or iOS
    final dbPath = await getDatabasesPath();
    //? Combines the DB Path with the Database file name
    final path = join(dbPath, filePath);

    //? Opens the Database for the usage based on the provided path
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /// getter variable for accessing the _database private variable
  /// Returns the _database is already created else
  /// it will initialize the database and it will return the DB
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB('note.db');
    return _database!;
  }

  /// create database table
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    // const boolType = 'BOOLEAN NOT NULL';
    // const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableName(
  ${UserField.id} $idType,
  ${UserField.username} $textType,
  ${UserField.mobile} $textType,
  ${UserField.email} $textType,
  ${UserField.password} $textType 
)
''');
  }

  ///? Code for Inserting the Data / Record
  ///Code for Registering a new User
  Future<User> registerUser(User user) async {
    final db = await instance.database;
    // var isExists = await isUserExists(user.email);
    // if (isExists == false) {
    //   throw Exception('Email Id Already Exists');
    // }
    //?This method helps insert a map of [values] into the specified [table] and
    //returns the id of the last inserted row.
    final id = await db.insert(tableName, user.toJson());
    return user.copy(id: id);
  }

  Future<bool> isUserExists(String email) async {
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: UserField.values,
      where: '${UserField.email} = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  //? Code to Read a Single Record
  Future<bool> validUser(String email, String password) async {
    final db = await instance.database;
    //Same as; Select * from tableName where id = ?

    final maps = await db.query(tableName,
        columns: UserField.values,
        where: '${UserField.email} = ? and ${UserField.password} = ?',
        whereArgs: [email, password]);

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Code to release the resources
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
