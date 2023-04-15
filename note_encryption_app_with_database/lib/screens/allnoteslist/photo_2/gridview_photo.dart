import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/utility/utility.dart';

import '../../../model/SavePhoto.dart';

class PhotoGridView extends StatefulWidget {
  final int id;
  final String photo_name;
  //final String delete;
  final Function deleteFunction;

  const PhotoGridView({
    required this.id,
    required this.photo_name,
    required this.deleteFunction,
    Key? key,
  }) : super(key: key);

  @override
  State<PhotoGridView> createState() => _PhotoGridViewState();
}

class _PhotoGridViewState extends State<PhotoGridView> {
  late List<SavePhoto> images;
  @override
  void initState() {
    super.initState();
    images = [];
    //dbHelper = DbHelper();
    //refreshImages();
  }

  @override
  Widget build(BuildContext context) {
    var anotherPhoto = SavePhoto(
      id: widget.id,
      photo_name: widget.photo_name,
    );
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
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
                    TextButton(
                      onPressed: () {
                        widget.deleteFunction(anotherPhoto);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: const Text("YES"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        child: SizedBox(
          height: 300,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: images.map((savePhoto) {
              return Utility.imageFromBase64String(widget.photo_name);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
