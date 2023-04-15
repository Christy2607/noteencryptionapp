class AllNoteModel {
  late String title;
  late String description;
  late String photo;
  late String document;
  late String usernameemail;
  late String allpassword;

  AllNoteModel(this.title, this.description, this.photo, this.document,
      this.usernameemail, this.allpassword);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      //'user_name': user_name,
      'title': title,
      'description': description,
      'photo': photo,
      'document': document,
      'usernameemail': usernameemail,
      'allpassword': allpassword,
    };
    return map;
  }

  AllNoteModel.fromMap(Map<String, dynamic> map) {
    //user_name = map['user_name'];
    title = map['title'];
    description = map['description'];
    photo = map['photo'];
    document = map['document'];
    usernameemail = map['usernameemail'];
    allpassword = map['allpassword'];
  }
}
