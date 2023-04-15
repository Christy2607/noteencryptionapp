import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextButtonDelete extends StatefulWidget {
  final int id;
  //final String photo_name;
  final Function deleteFunction;

  const TextButtonDelete(
      {Key? key, required this.deleteFunction, required this.id})
      : super(key: key);

  @override
  State<TextButtonDelete> createState() => _TextButtonDeleteState();
}

class _TextButtonDeleteState extends State<TextButtonDelete> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.deleteFunction;
      },
      child: Container(
        //color: Colors.green,
        padding: const EdgeInsets.all(14),
        child: const Text("YES"),
      ),
    );
  }
}
