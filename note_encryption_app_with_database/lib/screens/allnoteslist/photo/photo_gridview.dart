// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../model/SavePhotoModel.dart';

// class GridViewPhoto extends StatelessWidget {
//   late List<SavePhotoModel> images;
//   GridViewPhoto({required this.images, super.key});

//   @override
//   Widget build(BuildContext context) {
//     late List<SavePhotoModel> images;

//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 1.0,
//         mainAxisSpacing: 4.0,
//         crossAxisSpacing: 4.0,
//         children: images.map((SavePhotoModel) {
//           return Utility.imageFromBase64String(SavePhotoModel.photo_name);
//         }).toList(),
//       ),
//     );
//   }
// }
