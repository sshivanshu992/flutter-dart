import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:note_app/models/note.dart';

class NoteDatabase {
  //? Creating the SingleTon instance for the NotesDatabase class
  static final NoteDatabase instance = NoteDatabase._init();
  NoteDatabase._init();

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

  /// create database table name
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    // create table 'table_name' (_id, column name,-----)
    await db.execute('''
CREATE TABLE $tableName(
  ${NoteField.id} $idType,
  ${NoteField.isImportant} $boolType,
  ${NoteField.priorityLevel} $integerType,
  ${NoteField.title} $textType,
  ${NoteField.description} $textType,
  ${NoteField.time} $textType
)
''');
//end of execute mathod
  } //end of _createDB

  ///? Code for Inserting the Data / Record
  Future<Note> create(Note note) async {
    final db = await instance.database;
    //?This method helps insert a map of [values] into the specified [table] and
    //returns the id of the last inserted row.
    final id = await db.insert(tableName, note.toJson());
    return note.copy(id: id);
  }
//login or etc.....

  //? Code to Read a Single Record
  Future<Note> readNote(int id) async {
    final db = await instance.database;
    //Select * from tableName where id = 'values'
    final maps = await db.query(tableName,
        columns: NoteField.values,
        where: '${NoteField.id} = ?', //(id) //{id,name, city}
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('Id $id not found');
    }
  }

  //? Code to Read All the Records
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = '${NoteField.time} ASC';

    //final result = await db.rawQuery('SELECT * from $tableName order by $orderBy');
    
    final result = await db.query(tableName, orderBy: orderBy);
    return result.map((json) => Note.fromJson(json)).toList();
  }

  //? Code to Update / Modify the Exsiting Data present within the Record
  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(tableName, note.toJson(),
        where: '${NoteField.id} = ?', whereArgs: [note.id]);
  }

  //? Remove or Delete the Existing Record from the Database Table
  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(tableName, where: '${NoteField.id} = ?', whereArgs: [id]);
  }

  //Code to release the resources
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
