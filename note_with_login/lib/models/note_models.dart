//this one is a table name
const String noteTableName = 'note';

class NoteField {
  // table column names
  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
  static const String userId = 'userId';

  // just replace the value * to values like
  //  select * from table_name
  // select values from table_name
  static final List<String> values = [
    id,
    title,
    description,
    time,
    userId,
  ];
}

class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime createTime;
  final int userId;

  const Note({
    this.id,
    required this.title,
    required this.description,
    required this.createTime,
    required this.userId,
  });

  Note copy({
    int? id,
    String? title,
    String? description,
    DateTime? createTime,
    int? userId,
  }) =>
      Note(
          id: id ?? this.id,
          title: title ?? this.title,
          description: description ?? this.description,
          createTime: createTime ?? this.createTime,
          userId: userId ?? this.userId);

  ///? Code to Read the value from the JSON data to Fields
  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteField.id] as int?,
        title: json[NoteField.title] as String,
        description: json[NoteField.description] as String,
        createTime: DateTime.parse(json[NoteField.time] as String),
        userId: json[NoteField.userId] as int,
      );

  ///? Code to Write Values from the Fields to JSON
  Map<String, Object?> toJson() => {
        NoteField.id: id,
        NoteField.title: title,
        NoteField.description: description,
        NoteField.time: createTime.toIso8601String(),
        NoteField.userId: userId,
      };
}
