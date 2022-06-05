///table name
const String tableName = 'notes';

///table columns
class NoteField {
  //create table 'table_name' ('id' int not null primary key autoincrement)
  // classname.id==_id

  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String priorityLevel = 'priorityLevel';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';

  //select * from tableName;

  // ${Class_name.values}
  static final List<String> values = [
    id,
    isImportant,
    priorityLevel,
    title,
    description,
    time,
  ];
}

// create table 'table_name' (id int not null primary key autoincrement)
// insert into 'table_name' values(12,ture, 8, 'kjhfakdj',........)
class Note {
  final int? id; //auto add
  final bool isImportant;
  final int priorityLevel;
  final String title;
  final String description;
  final DateTime createdTime;

  ///? Create a Const Consturctor
  const Note(
      {this.id,
      required this.isImportant,
      required this.priorityLevel,
      required this.title,
      required this.description,
      required this.createdTime});

  ///? Create a Copy Method
  // null , null, null,............
  
  //
  Note copy(
          {int? id,
          bool? isImportant,
          int? priorityLevel,
          String? title,
          String? description,
          DateTime? createdTime}) =>
      Note(
        // null , null, null,............
        id: id ?? this.id, // null -------
        isImportant: isImportant ?? this.isImportant,
        priorityLevel: priorityLevel ?? this.priorityLevel,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  ///? Code to Read the value from the JSON data to Fields
  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteField.id] as int?,
        isImportant: json[NoteField.isImportant] == 1,
        priorityLevel: json[NoteField.priorityLevel] as int,
        title: json[NoteField.title] as String,
        description: json[NoteField.description] as String,
        createdTime: DateTime.parse(json[NoteField.time] as String),
      );

  ///? Code to Write Values from the Fields to JSON
  Map<String, Object?> toJson() => {
        NoteField.id: id,
        NoteField.isImportant: isImportant ? 1 : 0,
        NoteField.priorityLevel: priorityLevel,
        NoteField.title: title,
        NoteField.description: description,
        NoteField.time: createdTime.toIso8601String(),
      };
}
