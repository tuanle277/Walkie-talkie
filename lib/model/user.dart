class UserInfo {
  String id;
  String name;
  String classYear;
  String username;
  String password;

  UserInfo(
    this.id,
    this.name,
    this.classYear,
    this.username,
    this.password,
  );

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      json['id'],
      json['name'],
      json['classYear'],
      json['username'],
      json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'classYear': classYear,
        'username': username,
        'password': password
      };
}
