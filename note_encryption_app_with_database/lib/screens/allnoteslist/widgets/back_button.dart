import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackButtonWidget extends StatelessWidget {
  final String route;
  const BackButtonWidget({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: const Icon(
        Icons.arrow_back,
        size: 40,
      ),
    );
  }
}
