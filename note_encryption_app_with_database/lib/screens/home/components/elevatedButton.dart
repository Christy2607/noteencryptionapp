// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class ButtonNote extends StatefulWidget {
//   final String route;
//   final String text;
//   const ButtonNote({super.key, required this.route, required this.text});

//   @override
//   State<ButtonNote> createState() => _ButtonNoteState();
// }

// class _ButtonNoteState extends State<ButtonNote> {
//   late final String route;
//   late final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
//       height: 90,
//       width: MediaQuery.of(context).size.width,
//       child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, route);
//           },
//           // ignore: prefer_const_constructors
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               text,
//               style: const TextStyle(fontSize: 35),
//             ),
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoteButton extends StatelessWidget {
  final String route;
  final String text;
  final String route_add;

  const NoteButton(
      {super.key,
      required this.route,
      required this.text,
      required this.route_add});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          height: 90,
          width: 300,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 48, 73),
              ),
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
              // ignore: prefer_const_constructors
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 35),
                ),
              )),
        ),
        // Container(
        //   padding: const EdgeInsets.only(left: 6, top: 20),
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        //       shape: const CircleBorder(),
        //     ),
        //     onPressed: () {
        //       Navigator.pushNamed(context, route_add);
        //     },
        //     child: const Icon(
        //       Icons.add,
        //       size: 40,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
