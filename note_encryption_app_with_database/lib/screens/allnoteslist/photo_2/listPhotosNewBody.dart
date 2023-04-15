import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/photo_2/textButtonWidget.dart';

import '../../../model/SavePhoto.dart';
import '../../../utility/utility.dart';
import '../widgets/back_button.dart';

class ListPhotoNewBody extends StatefulWidget {
  final String photo_name;
  const ListPhotoNewBody({super.key, required this.photo_name});

  @override
  State<ListPhotoNewBody> createState() => _ListPhotoNewBodyState();
}

class _ListPhotoNewBodyState extends State<ListPhotoNewBody> {
  late Future<File> imageFile;
  late Image image;
  late DbHelper dbHelper;
  late List<SavePhoto> images;
  var selectedItem = "";

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DbHelper();
    refreshImages();
  }

  refreshImages() {
    dbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
    });
  }

  pickImageFromGallery() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((imgFile) async {
      String imgString = Utility.base64String(await imgFile!.readAsBytes());
      print(imgString);
      SavePhoto photo1 = SavePhoto(photo_name: imgString);
      dbHelper.savePhotos(photo1);
      refreshImages();
    });
  }

  void deleteItem(SavePhoto savePhoto) async {
    await dbHelper.deletePhotos(savePhoto);
    setState(() {});
    //refreshImages();
    Navigator.pushNamed(context, '/listofphotos');
  }

  getPhoto() {
    images.map((SavePhoto) {
      return Utility.imageFromBase64String(SavePhoto.photo_name);
    }).toList();
  }

  gridView() => Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: images.map((SavePhoto) {
              return GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Delete Image"),
                      content: const Text("Click Yes To Delete Image"),
                      actions: <Widget>[
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                //color: Colors.green,
                                padding: const EdgeInsets.all(14),
                                child: const Text("CANCEL"),
                              ),
                            ),
                            // TextButtonDelete(
                            //   deleteFunction: deleteItem,
                            //   id: widget.id,
                            // ),
                            TextButton(
                              onPressed: () {
                                deleteItem(SavePhoto);
                              },
                              // onPressed: () {
                              //   //SavePhotoModel stModel = SavePhotoModel(0, );
                              // },
                              child: Container(
                                //color: Colors.green,
                                padding: const EdgeInsets.all(14),
                                child: const Text("DELETE"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                child: Utility.imageFromBase64String(SavePhoto.photo_name),
              );
            }).toList(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var anotherPhoto = SavePhoto(photo_name: widget.photo_name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        leading: const BackButtonWidget(route: '/home'),
        title: const Text(
          'Your Photos',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: gridView(),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        onPressed: () {
          pickImageFromGallery();
          //Navigator.pushNamed(context, '/savetext');
        },
        child: const Icon(Icons.add),
      ),
      //body: gridView(),
    );
  }
}
