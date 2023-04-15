class SavePasswordModel {
  int? id;
  late String user_email;
  late String password;
  late String passwordTitle;
  // late final String passwordDescription;

  SavePasswordModel(
      {required this.user_email,
      required this.password,
      required this.passwordTitle,
      //required this.passwordDescription,
      this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_email': user_email,
      'password': password,
      'passwordTitle': passwordTitle,
      //'passwordDescription': passwordDescription,
    };
    return map;
  }

  SavePasswordModel.fromMap(Map<String, dynamic> map) {
    user_email = map['user_email'];
    password = map['password'];
    passwordTitle = map['passwordTitle'];
    //passwordDescription = map['passwordDescription'];
  }

  String toString() {
    return 'SavePasswordModel(id: $id, user_email: $user_email, password: $password, passwordTitle:$passwordTitle)';
  }
}
