class AuthModel {
  String? username;
  String? password;

  AuthModel({
    this.username,
    this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
