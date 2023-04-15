import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/model/SaveDocumentModel.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/result_text.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/title_text.dart';

class NoteDocumentCard extends StatefulWidget {
  final int id;
  final String documentTitle;
  final String documentDescription;
  final Function deleteFunction;

  NoteDocumentCard(
      {required this.id,
      required this.documentTitle,
      required this.deleteFunction,
      Key? key,
      required this.documentDescription})
      : super(key: key);

  @override
  State<NoteDocumentCard> createState() => _NoteDocumentCardState();
}

class _NoteDocumentCardState extends State<NoteDocumentCard> {
  @override
  Widget build(BuildContext context) {
    var anotherDocument = SaveDocumentModel(
        //documentPath: widget.documentTitle,
        documentTitle: widget.documentTitle,
        documentDescription: widget.documentDescription,
        id: widget.id);
    return SizedBox(
      height: 65,
      child: Card(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const TitleTextWidget(text: 'Title: '),
                      ResultTextWidget(text: widget.documentTitle),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const TitleTextWidget(text: 'Description: '),
                      ResultTextWidget(text: widget.documentDescription),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                widget.deleteFunction(anotherDocument);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
