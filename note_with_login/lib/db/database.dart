import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note_models.dart';
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
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $userTableName(
  ${UserField.id} $idType,
  ${UserField.username} $textType,
  ${UserField.mobile} $textType,
  ${UserField.email} $textType,
  ${UserField.password} $textType,
)
''');

    //// creating the Note table
    await db.execute('''
CREATE TABLE $noteTableName(
  ${NoteField.id} $idType,
  ${NoteField.title} $textType,
  ${NoteField.description} $textType,
  ${NoteField.time} $textType,
  ${NoteField.userId} $integerType,
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
    final id = await db.insert(userTableName, user.toJson());
    return user.copy(id: id);
  }

  Future<bool> isUserExists(String email) async {
    final db = await instance.database;
    // select * from table_name WHERE COLUMN_NAME = 'shivancu@mail.com'; // id, name, email, phone, password
    final maps = await db.query(
      userTableName,
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

    final maps = await db.query(userTableName,
        columns: UserField.values,
        where: '${UserField.email} = ? and ${UserField.password} = ?',
        whereArgs: [email, password]);

    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //only for one row or Record
  Future<User> getUserInfo(String email) async {
    final db = await instance.database;
    // final orderBy = '${NoteField.time} ASC';
    // select * from table_name WHERE colmn_name = 'shivasu@gmail.com'
    final maps = await db.query(userTableName,
        columns: UserField.values,
        where: '${UserField.email} = ?',
        whereArgs: [email]);
// v= [1,2,3,4,5,6,7,8,9,0]
// a = v[0]
// a = 1

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('Id $email not found');
    }
  }



// ----------------------------------Note Table--------------------------------
  Future<Note> insertNote(Note note) async {
    final db = await instance.database;
    final id = await db.insert(noteTableName, note.toJson());
    //returns the id of the last inserted row.
    return note.copy(id: id);
  }

  ///Read all note from the table
  Future<List<Note>> getAllNote(Note note) async {
    final db = await instance.database;
    // final orderBy = '${NoteField.time} ASC';
    // final x = await db.rawQuery('SELECT * FROM $noteTableName');
    final res = await db.query(noteTableName, orderBy: '${NoteField.time} ASC');
    //returns the id of the last inserted row.
    return res.map((e) => Note.fromJson(e)).toList();
  }

  ///
  Future<Note> getSingleNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(noteTableName,
        columns: NoteField.values,
        where: '${NoteField.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('Id $id not found');
    }
  }

  //Code to release the resources
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
