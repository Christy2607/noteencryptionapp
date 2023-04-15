// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
// import 'package:note_encryption_app_with_database/model/SavePhotoModel.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/photo_2/gridview_photo.dart';

// import '../../../model/SavePhoto.dart';
// import '../../../utility/utility.dart';

// class PhotoListView extends StatelessWidget {
//   final db = DbHelper();
//   final Function deleteFunction;

//   PhotoListView({required this.deleteFunction, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     late List<SavePhoto> images;
//     return Expanded(
//       child: FutureBuilder(
//         future: db.getPhotos(),
//         initialData: const [],
//         builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//           var data = snapshot.data;
//           var dataLength = data!.length;

//           return dataLength == 0
//               ? const Center(
//                   child: Text('no data found'),
//                 )
//               : GridView.count(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1.0,
//                   mainAxisSpacing: 4.0,
//                   crossAxisSpacing: 4.0,
//                    children: images.map((SavePhotoModel) {
//               return Utility.imageFromBase64String(SavePhotoModel.photo_name);
//             }).toList(),
//                 );
//           // : ListView.builder(
//           //     itemCount: dataLength,
//           //     itemBuilder: (context, i) => PhotoGridView(
//           //       id: data[i].id,
//           //       photo_name: data[i].photo_name,
//           //       deleteFunction: deleteFunction,
//           //     ),
//           //   );
//         },
//       ),
//     );
//   }
// }
