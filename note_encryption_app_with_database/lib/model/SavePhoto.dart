class SavePhoto {
  int? id;
  late String photo_name;

  SavePhoto({required this.photo_name, this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photo_name': photo_name,
    };
    return map;
  }

  SavePhoto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photo_name = map['photo_name'];
  }

  String toString() {
    return 'SavePhoto(id:$id, photo_name:$photo_name)';
  }
}
