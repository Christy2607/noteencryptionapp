import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/model/SaveTextModel.dart';

class Notecard extends StatefulWidget {
  final int id;
  final String textTitle;
  final String textDescription;

  Notecard(
      {required this.id,
      required this.textTitle,
      required this.textDescription,
      Key? key})
      : super(key: key);
  //const Notecard({super.key});

  @override
  State<Notecard> createState() => _NotecardState();
}

class _NotecardState extends State<Notecard> {
  @override
  Widget build(BuildContext context) {
    var anotherSaveText = SaveTextModel(
        textTitle: widget.textTitle,
        textDescription: widget.textDescription,
        id: widget.id);
    return Card(
        child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.textTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
