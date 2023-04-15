import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';

import 'document_card.dart';

class DocumentList extends StatelessWidget {
  final db = DbHelper();
  final Function deleteFunction;
  DocumentList({required this.deleteFunction, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getDocument(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? const Center(
                  child: Text('no data found'),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => NoteDocumentCard(
                    id: data[i].id,
                    documentTitle: data[i].documentTitle,
                    documentDescription: data[i].documentDescription,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
