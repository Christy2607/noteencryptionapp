// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
// import 'package:note_encryption_app_with_database/model/SavePhoto.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/photo_2/list_photo.dart';

// import '../../../utility/utility.dart';
// import '../widgets/back_button.dart';

// class PhotosList extends StatefulWidget {
//   const PhotosList({super.key});

//   @override
//   State<PhotosList> createState() => _PhotosListState();
// }

// class _PhotosListState extends State<PhotosList> {
//   late Future<File> imageFile;
//   late Image image;
//   //var selectedItem = "";
//   late List<SavePhoto> images;
//   late DbHelper dbHelper;

//   // var db = DbHelper();

//   @override
//   void initState() {
//     super.initState();
//     //images = [];
//     dbHelper = DbHelper();
//     //refreshImages();
//   }

//   refreshImages() {
//     dbHelper.getPhotos().then((imgs) {
//       setState(() {
//         images.clear();
//         images.addAll(imgs);
//       });
//     });
//   }

//   // refreshImages() {
//   //   dbHelper.getPhotos().then((img) {
//   //     setState(() {
//   //       images.clear();
//   //       images.addAll(img);
//   //     });
//   //   });
//   // }

//   void deleteItem(SavePhoto savePhoto) async {
//     await dbHelper.deletePhotos(savePhoto);
//     setState(() {});
//   }

//   pickImageFromGallery() async {
//     await ImagePicker()
//         .pickImage(source: ImageSource.gallery)
//         .then((imgFile) async {
//       String imgString = Utility.base64String(await imgFile!.readAsBytes());
//       print(imgString);
//       SavePhoto photo1 = SavePhoto(photo_name: imgString);
//       dbHelper.savePhotos(photo1);
//       // refreshImages();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 0, 48, 73),
//         leading: const BackButtonWidget(route: '/home'),
//         title: const Text(
//           'Your Photos',
//           style: TextStyle(fontSize: 35),
//         ),
//       ),
//       body: Column(
//         children: [
//           PhotoListView(deleteFunction: deleteItem),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 0, 48, 73),
//         onPressed: () {
//           pickImageFromGallery();
//           //Navigator.pushNamed(context, '/savetext');
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
