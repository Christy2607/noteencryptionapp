class SaveTextModel {
  String textTitle;
  String textDescription;
  int? id;

  SaveTextModel(
      {required this.textTitle, required this.textDescription, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'textTitle': textTitle,
      'textdescription': textDescription,
    };
    return map;
  }

  SaveTextModel.fromMap(
      Map<String, dynamic> map, this.textTitle, this.textDescription) {
    textTitle = map['textTitle'];
    id = map['id'];
    textDescription = map['textDescription'];
  }

  String toString() {
    return 'SaveTextModel(id : $id, textTitle : $textTitle, textDescription : $textDescription)';
  }
}
