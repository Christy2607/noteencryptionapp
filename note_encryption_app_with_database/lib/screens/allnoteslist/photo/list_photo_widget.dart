// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';

// import 'photo_card.dart';

// class PhotoList extends StatelessWidget {
//   final db = DbHelper();
//   final Function deleteFunction;

//   PhotoList({required this.deleteFunction, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: FutureBuilder(
//         future: db.getPhoto(),
//         initialData: const [],
//         builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//           var data = snapshot.data;
//           var dataLength = data!.length;

//           return dataLength == 0
//               ? const Center(
//                   child: Text('no data found'),
//                 )
//               : ListView.builder(
//                   itemCount: dataLength,
//                   itemBuilder: (context, i) => NotePhotoCard(
//                     id: data[i].id,
//                     photoTitle: data[i].photoTitle,
//                     photoDescription: data[i].photoDescription,
//                     deleteFunction: deleteFunction,
//                   ),
//                 );
//         },
//       ),
//     );
//   }
// }
