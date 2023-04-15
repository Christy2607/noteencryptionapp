class SavePhotoModel {
  //late String photo_name;
  late int? id;
  // late final String photoTitle;
  //late final String photoDescription;
  late String photo_name;

  SavePhotoModel(this.id, this.photo_name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photo_name': photo_name,
      //'photoTitle': photoTitle,
      //'photoDescription': photoDescription,
    };
    return map;
  }

  SavePhotoModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photo_name = map['photo_name'];
    //photoTitle = map['photoTitle'];
    //photoDescription = map['photoDescription'];
  }

  // String toString() {
  //   return 'SavePhotoModel(id: $id, photo_name: $photo_name, photoTitle:$photoTitle, photoDescription: $photoDescription)';
  //   ;
  // }
}
