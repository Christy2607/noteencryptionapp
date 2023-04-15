class SaveDocumentModel {
  int? id;
  // late String documentPath;
  late String documentTitle;
  late String documentDescription;

  SaveDocumentModel(
      {required this.documentTitle,
      required this.documentDescription,
      this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'documentTitle': documentTitle,
      'documentDescription': documentDescription,
      // 'documentPath': documentPath,
    };
    return map;
  }

  SaveDocumentModel.fromMap(Map<String, dynamic> map) {
    documentTitle = map['documentTitle'];
    documentDescription = map['documentDescription'];
    // documentPath = map['documentPath'];
  }

  String toString() {
    return 'SaveDocumentModel(id: $id, documentTitle:$documentTitle, documentDescription:$documentDescription)';
  }
}
