import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/comm/comHelper.dart';
import 'package:note_encryption_app_with_database/model/AllNoteModel.dart';
//import 'package:note_encryption_app_with_database/databaseHandler/DbHelperText.dart';
import 'package:note_encryption_app_with_database/model/SaveTextModel.dart';

import '../../databaseHandler/DbHelper.dart';

class SaveTextBody extends StatefulWidget {
  const SaveTextBody({super.key});

  @override
  State<SaveTextBody> createState() => _SaveTextBodyState();
}

class _SaveTextBodyState extends State<SaveTextBody> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  saveText() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    //int id1 = id;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SaveTextModel stModel =
          SaveTextModel(textTitle: title, textDescription: description);
      await dbHelper.saveDataText(stModel).then((textData) {
        alertDialog(context, "Successfully Saved");
        Navigator.pushNamed(context, '/listoftext');
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Data Save Fail");
      });
    }
  }
  // saveText() async {
  //   String title = _titleController.text;
  //   String description = _descriptionController.text;
  //   String photo = _photo.text;
  //   String document = _document.text;
  //   String usernameemail = _usernameemail.text;
  //   String allpassword = _password.text;

  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     AllNoteModel stModel = AllNoteModel(
  //         title, description, photo, document, usernameemail, allpassword);
  //     await dbHelper.saveDataText(stModel).then((textData) {
  //       alertDialog(context, "Successfully Saved");
  //       Navigator.pushNamed(context, '/home');
  //     }).catchError((error) {
  //       print(error);
  //       alertDialog(context, "Error: Data Save Fail");
  //     });
  //   }
  // }

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
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(20),
                //   bottomRight: Radius.circular(20),
                // ),
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 55, left: 55, right: 0),
                    child: const Text(
                      "Save Text",
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
                      "Save your notes in our app to keep it secure.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
              child: const Text(
                "Enter Title of Text",
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
                "Enter Text Description",
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
                // onPressed: () {},
                onPressed: saveText,
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
