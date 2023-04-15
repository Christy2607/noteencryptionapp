import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/model/SaveTextModel.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/result_text.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/title_text.dart';

class NoteTextCard extends StatefulWidget {
  final int id;
  final String textTitle;
  final String textDescription;
  final Function deleteFunction;
  //final Function deleteFunction1;
  //var db = DbHelper();
  const NoteTextCard({
    required this.id,
    required this.textTitle,
    required this.textDescription,
    required this.deleteFunction,
    Key? key,
  }) : super(key: key);

  @override
  State<NoteTextCard> createState() => _NoteTextCardState();
}

class _NoteTextCardState extends State<NoteTextCard> {
  var db = DbHelper();
  void deleteItem(SaveTextModel saveTextModel) async {
    await db.deleteText(saveTextModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var anotherText = SaveTextModel(
        textTitle: widget.textTitle,
        textDescription: widget.textDescription,
        id: widget.id);
    return Card(
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextWidget(
                text: 'Title: ',
              ),
              ResultTextWidget(
                text: widget.textTitle,
              ),
              SizedBox(
                height: 5,
              ),
              TitleTextWidget(
                text: 'Text Description: ',
              ),
              ResultTextWidget(
                text: widget.textDescription,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            widget.deleteFunction(anotherText);
          },
          icon: const Icon(Icons.close),
        ),
      ]),
    );
  }
}
