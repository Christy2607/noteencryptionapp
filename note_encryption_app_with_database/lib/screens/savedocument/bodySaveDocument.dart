// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:image_picker/image_picker.dart';

import '../../comm/comHelper.dart';
import '../../databaseHandler/DbHelper.dart';
import '../../model/SaveDocumentModel.dart';
import 'package:file_picker/file_picker.dart';

class SaveDocumentBody extends StatefulWidget {
  const SaveDocumentBody({super.key});

  @override
  State<SaveDocumentBody> createState() => _SaveDocumentBodyState();
}

class _SaveDocumentBodyState extends State<SaveDocumentBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  var txtFilePicker = TextEditingController();
  //File? filePickerVal;

  var dbHelper;
  //late File _document;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  _pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      setState(() {
        _titleController.text = result.files.single.name;
        //filePickerVal = File(result.files.single.path.toString());
      });
    } else {
      // User canceled the picker
    }
    // if (result != null) {
    //   File document = File(result.files.single.path);
    // } else {
    //   // User canceled the picker
    // }
  }

  saveDocument() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    //String documentpath = _document.path;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SaveDocumentModel stModel = SaveDocumentModel(
        documentTitle: title,
        documentDescription: description,
        // documentPath: documentpath
      );
      await dbHelper.saveDataDocument(stModel).then((documentData) {
        alertDialog(context, "Successfully Saved");
        Navigator.pushNamed(context, '/listofdocument');
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Data Save Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 190,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 48, 73),
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 55, left: 55, right: 0),
                    child: const Text(
                      "Save Document",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 10, left: 55, right: 0),
                    child: const Text(
                      "Save your document in our app to keep it secure.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //mulai sini
            Container(
              padding: const EdgeInsets.only(top: 20, left: 45, right: 0),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.attach_file,
                    size: 40,
                  ),
                  const SizedBox(width: 10),
                  MaterialButton(
                    //padding: const EdgeInsets.only(top: 0, left: 30, right: 0),
                    color: Color.fromARGB(255, 0, 48, 73),
                    onPressed: () {},
                    //onPressed: _pickFile,
                    child: const Text(
                      "Choose Document",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //disini selesai
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
              child: const Text(
                "Enter Title of Document",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
              child: TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title cannot be empty';
                  } else if (value.length > 50) {
                    return 'Max.50 characters';
                  }
                  return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
              child: const Text(
                "Enter Document Description",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
              child: TextFormField(
                controller: _descriptionController,
                validator: (value) {
                  if (value!.length > 500) {
                    return 'Max. 500 Characters';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Full Name',
                ),
                maxLines: 40, // <-- SEE HERE
                minLines: 1,
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              //width: 20,
              //alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 40, left: 120, right: 120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 48, 73),
                ),
                onPressed: saveDocument,
                child: const Text(
                  "SAVE",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Container(
              height: 73,
              width: MediaQuery.of(context).size.width,
              //width: 20,
              //alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 10, left: 120, right: 120),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 48, 73),
                ),
                child: const Text(
                  "CANCEL",
                  style: TextStyle(fontSize: 28),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
