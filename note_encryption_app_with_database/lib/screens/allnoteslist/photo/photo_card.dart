// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:note_encryption_app_with_database/model/SavePhotoModel.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/result_text.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/title_text.dart';

// class NotePhotoCard extends StatefulWidget {
//   final int id;
//   final String photoTitle;
//   final String photoDescription;
//   final Function deleteFunction;

//   const NotePhotoCard(
//       {required this.id,
//       required this.photoTitle,
//       required this.deleteFunction,
//       Key? key,
//       required this.photoDescription})
//       : super(key: key);

//   @override
//   State<NotePhotoCard> createState() => _NotePhotoCardState();
// }

// class _NotePhotoCardState extends State<NotePhotoCard> {
//   @override
//   Widget build(BuildContext context) {
//     var anotherPhoto = SavePhotoModel(
//         photo_name: widget.photoDescription,
//         photoTitle: widget.photoTitle,
//         photoDescription: widget.photoTitle,
//         id: widget.id);
//     return SizedBox(
//       height: 65,
//       child: Card(
//         child: Row(children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     const TitleTextWidget(text: 'Title: '),
//                     ResultTextWidget(text: widget.photoTitle)
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Row(
//                   children: [
//                     const TitleTextWidget(text: 'Description: '),
//                     ResultTextWidget(text: widget.photoDescription)
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               widget.deleteFunction(anotherPhoto);
//             },
//             icon: const Icon(Icons.close),
//           ),
//         ]),
//       ),
//     );
//   }
// }
