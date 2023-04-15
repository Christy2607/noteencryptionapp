class UserModel {
  //late String user_name;
  late String password;

  //UserModel(this.user_name, this.password);
  UserModel(this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      //'user_name': user_name,
      'password': password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    //user_name = map['user_name'];
    password = map['password'];
  }

  //UserModel user = UserModel.fromMap(snapshot.data!.data());
}
