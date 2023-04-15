import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/model/SaveDocumentModel.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/document/list_document_widget.dart';

import '../widgets/back_button.dart';

class ListDocumentBody extends StatefulWidget {
  const ListDocumentBody({super.key});

  @override
  State<ListDocumentBody> createState() => _ListDocumentBodyState();
}

class _ListDocumentBodyState extends State<ListDocumentBody> {
  var db = DbHelper();
  void deleteItem(SaveDocumentModel saveDocumentModel) async {
    await db.deleteDocument(saveDocumentModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        leading: const BackButtonWidget(route: '/home'),
        title: const Text(
          'Your Document Notes',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(children: [
        DocumentList(deleteFunction: deleteItem),
      ]),
    );
  }
}
