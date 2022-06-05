//this one is a table name
const String userTableName = 'user';

// create table table_name (id type, username varchar);
//for table columns
class UserField {
  static const String id = '_id';
  static const String username = 'username';
  static const String mobile = 'mobile';
  static const String email = 'email';
  static const String password = 'password';
// select * from table_name
  static final List<String> values = [
    id,
    username,
    mobile,
    email,
    password,
  ];
}

class User {
  final int? id;
  final String username;
  final String mobile;
  final String email;
  final String password;

  const User({
    this.id,
    required this.username,
    required this.mobile,
    required this.email,
    required this.password,
  });
// select * from table_name;
// null, null , null, null, null
  User copy({
    int? id,
    String? username,
    String? mobile,
    String? email,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  ///? Code to Read the value from the JSON data to Fields
  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserField.id] as int?,
        username: json[UserField.username] as String,
        mobile: json[UserField.mobile] as String,
        email: json[UserField.email] as String,
        password: json[UserField.password] as String,
      );

  // static User justEmailFromJson(Map<String, Object?> json) => User(
  //       username: json[UserField.username] as String,
  //     );

  ///? Code to Write Values from the Fields to JSON
  Map<String, Object?> toJson() => {
        UserField.id: id,
        UserField.username: username,
        UserField.mobile: mobile,
        UserField.email: email,
        UserField.password: password,
      };
}
