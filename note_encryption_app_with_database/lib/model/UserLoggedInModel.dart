class UserLoginPasswdModel {
  late String password_login;

  UserLoginPasswdModel(this.password_login);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'password_login': password_login,
    };
    return map;
  }

  UserLoginPasswdModel.fromMap(Map<String, dynamic> map) {
    password_login = map['password_login'];
  }
}
