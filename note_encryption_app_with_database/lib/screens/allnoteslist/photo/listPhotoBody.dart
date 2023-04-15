// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
// import 'package:note_encryption_app_with_database/model/SavePhotoModel.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/photo/list_photo_widget.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../utility/utility.dart';
// import '../widgets/back_button.dart';

// class ListPhotoBody extends StatefulWidget {
//   ListPhotoBody() : super();

//   @override
//   State<ListPhotoBody> createState() => _ListPhotoBodyState();
// }

// class _ListPhotoBodyState extends State<ListPhotoBody> {
//   late Future<File> imageFile;
//   late Image image;
//   late DbHelper dbHelper;
//   late List<SavePhotoModel> images;
//   var selectedItem = "";
//   late final VoidCallback deleteFunction;

//   @override
//   void initState() {
//     super.initState();
//     images = [];
//     dbHelper = DbHelper();
//     refreshImages();
//   }

//   refreshImages() {
//     dbHelper.getPhotos().then((imgs) {
//       setState(() {
//         images.clear();
//         images.addAll(imgs);
//       });
//     });
//   }

//   pickImageFromGallery() async {
//     await ImagePicker()
//         .pickImage(source: ImageSource.gallery)
//         .then((imgFile) async {
//       String imgString = Utility.base64String(await imgFile!.readAsBytes());
//       print(imgString);
//       SavePhotoModel photo1 = SavePhotoModel(0, imgString);
//       //dbHelper.savePhoto(photo1);
//       refreshImages();
//     });
//   }

//   gridView() => Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: GestureDetector(
//           onLongPress: () {
//             showDialog(
//               context: context,
//               builder: (ctx) => AlertDialog(
//                 title: const Text("Delete Image"),
//                 content: const Text("Click Yes To Delete Image"),
//                 actions: <Widget>[
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(ctx).pop();
//                         },
//                         child: Container(
//                           //color: Colors.green,
//                           padding: const EdgeInsets.all(14),
//                           child: const Text("CANCEL"),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () => deleteItem,
//                         // onPressed: () {
//                         //   //SavePhotoModel stModel = SavePhotoModel(0, );
//                         // },
//                         child: Container(
//                           //color: Colors.green,
//                           padding: const EdgeInsets.all(14),
//                           child: const Text("YES"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//           child: GridView.count(
//             crossAxisCount: 2,
//             childAspectRatio: 1.0,
//             mainAxisSpacing: 4.0,
//             crossAxisSpacing: 4.0,
//             children: images.map((SavePhotoModel) {
//               return Utility.imageFromBase64String(SavePhotoModel.photo_name);
//             }).toList(),
//           ),
//         ),
//       );

//   //var anotherPhoto = SavePhotoModel(0, imgString);

//   // var db = DbHelper();
//   // void deleteItem(SavePhotoModel savePhotoModel) async {
//   //   await dbHelper.deletePhoto(savePhotoModel);
//   //   setState(() {});
//   // }

//   void deleteItem(SavePhotoModel savePhotoModel) async {
//     await dbHelper.deletePhoto(savePhotoModel);
//     setState(() {});
//   }

//   // void deletePhoto(int id) async {
//   //   await dbHelper.deletePhoto(id);
//   //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//   //     content: Text('Successfully deleted a journal!'),
//   //   ));
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 0, 48, 73),
//         leading: const BackButtonWidget(route: '/home'),
//         title: const Text(
//           'Your Photos',
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Flexible(
//             child: gridView(),
//           )
//         ],
//       )),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 0, 48, 73),
//         onPressed: () {
//           pickImageFromGallery();
//           //Navigator.pushNamed(context, '/savetext');
//         },
//         child: const Icon(Icons.add),
//       ),
//       //body: gridView(),
//     );
//   }
// }
