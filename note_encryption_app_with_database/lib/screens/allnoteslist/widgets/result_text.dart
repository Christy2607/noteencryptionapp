import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultTextWidget extends StatelessWidget {
  final String text;

  const ResultTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        //overflow: TextOverflow.visible,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
    );
  }
}
