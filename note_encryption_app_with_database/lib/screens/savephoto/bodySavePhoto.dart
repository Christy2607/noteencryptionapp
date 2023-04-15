// //import 'dart:html';

// //import 'dart:html';

// //import 'dart:html';
// import 'dart:io';
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../comm/comHelper.dart';
// import '../../databaseHandler/DbHelper.dart';
// import '../../model/SavePhotoModel.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../utility/utility.dart';
// //import 'package:cross_file/cross_file.dart';

// class SavePhotoBody extends StatefulWidget {
//   const SavePhotoBody({super.key});

//   @override
//   State<SavePhotoBody> createState() => _SavePhotoBodyState();
// }

// class _SavePhotoBodyState extends State<SavePhotoBody> {
//   final _formKey = GlobalKey<FormState>();
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();

//   late Future<File> imageFile;
//   late Image image;
//   late DbHelper dbHelper;
//   late List<SavePhotoModel> images;

//   //XFile? _image;
//   // late File imgFile;
//   //final imgPicker = ImagePicker();
//   //var dbHelper;
//   // final imgPicker = ImagePicker();

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
//       dbHelper.savePhoto(photo1);
//       refreshImages();
//     });
//   }

//   gridView() {
//     Padding(
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

//   // _pickImage() async {
//   //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     _image = image;
//   //   });
//   // }

//   // openGallery() async {
//   //   var imgGallery = await imgPicker.getImage(source: ImageSource.gallery);
//   //   setState(() {
//   //     imgFile = File(imgGallery.path);
//   //   });
//   //   Navigator.of(context).pop();
//   // }

//   // pickImageFromGallery() {
//   //   ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
//   //     String imgString = Utility.base64String(imgFile.readAsBytes());
//   //     SavePhotoModel savePhotoModel = SavePhotoModel(0, imgString);
//   //     dbHelper.saveDataPhoto(savePhotoModel);
//   //     refreshImages();
//   //   });
//   // }

//   // gridView() {
//   //   return Padding(
//   //     padding: EdgeInsets.all(5.0),
//   //     child: GridView.count(
//   //       crossAxisCount: 2,
//   //       childAspectRatio: 1.0,
//   //       mainAxisSpacing: 4.0,
//   //       crossAxisSpacing: 4.0,
//   //       children: images.map((savePhotoModel){
//   //         return
//   //       }),
//   //     ),
//   //   );
//   // }

//   // savePhoto() async {
//   //   String title = _titleController.text;
//   //   String description = _descriptionController.text;
//   //   //String imagepath = _image!.path;
//   //   //String title23 = _titleController.text;
//   //   if (_formKey.currentState!.validate()) {
//   //     _formKey.currentState!.save();
//   //     SavePhotoModel spModel =
//   //         SavePhotoModel(photoTitle: title, photoDescription: description);
//   //     await dbHelper.saveDataPhoto(spModel).then((photoData) {
//   //       alertDialog(context, "Successfully Saved");
//   //       Navigator.pushNamed(context, '/listofphoto');
//   //     }).catchError((error) {
//   //       print(error);
//   //       alertDialog(context, "Error: Data Save Fail");
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Form(
//         key: _formKey,
//         child: ListView(
//           children: <Widget>[
//             Container(
//               height: 190,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 0, 48, 73),
//               ),
//               child: ListView(
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding: const EdgeInsets.only(top: 55, left: 55, right: 0),
//                     child: const Text(
//                       "Save Photo",
//                       style: TextStyle(
//                         fontSize: 40,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding: const EdgeInsets.only(top: 10, left: 55, right: 0),
//                     child: const Text(
//                       "Save your photos in our app to keep it secure.",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //mulai sini
//             Container(
//               padding: const EdgeInsets.only(top: 20, left: 55, right: 0),
//               child: Row(
//                 children: <Widget>[
//                   // if (_image == null)
//                   //   const Text("No image Selected")
//                   // else
//                   //   Image.file(_image),
//                   const Icon(
//                     Icons.add_a_photo,
//                     size: 40,
//                   ),
//                   const SizedBox(width: 15),
//                   MaterialButton(
//                     //padding: const EdgeInsets.only(top: 0, left: 30, right: 0),
//                     color: const Color.fromARGB(255, 0, 48, 73),
//                     onPressed: () {},
//                     //onPressed: _pickImage,
//                     child: const Text(
//                       "Choose Image",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             //disini selesai
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
//               child: const Text(
//                 "Enter Title of Image",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
//               child: TextFormField(
//                 controller: _titleController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Title cannot be empty';
//                   } else if (value.length > 50) {
//                     return 'Max.50 characters';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
//               child: const Text(
//                 "Enter Image Description",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
//               child: TextFormField(
//                 controller: _descriptionController,
//                 validator: (value) {
//                   if (value!.length > 500) {
//                     return 'Max. 500 Characters';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   //labelText: 'Full Name',
//                 ),
//                 maxLines: 40, // <-- SEE HERE
//                 minLines: 1,
//               ),
//             ),
//             Container(
//               height: 100,
//               width: MediaQuery.of(context).size.width,
//               //width: 20,
//               //alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 40, left: 120, right: 120),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 48, 73),
//                 ),
//                 //onPressed: savePhoto,
//                 onPressed: pickImageFromGallery,
//                 child: const Text(
//                   "SAVE",
//                   style: TextStyle(fontSize: 28),
//                 ),
//               ),
//             ),
//             Container(
//               height: 73,
//               width: MediaQuery.of(context).size.width,
//               //width: 20,
//               //alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 10, left: 120, right: 120),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 48, 73),
//                 ),
//                 child: const Text(
//                   "CANCEL",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/home');
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
