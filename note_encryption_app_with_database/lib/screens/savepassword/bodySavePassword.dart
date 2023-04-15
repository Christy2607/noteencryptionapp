import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/comm/comHelper.dart';
import 'package:note_encryption_app_with_database/model/SavePasswordModel.dart';

import '../../databaseHandler/DbHelper.dart';

class SavePasswordBody extends StatefulWidget {
  const SavePasswordBody({super.key});

  @override
  State<SavePasswordBody> createState() => _SavePasswordBodyState();
}

class _SavePasswordBodyState extends State<SavePasswordBody> {
  final _formKey = GlobalKey<FormState>();
  final _userEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  savePassword() async {
    String user_email = _userEmailController.text;
    String passwd = _passwordController.text;
    String title = _titleController.text;
    String desc = _descriptionController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SavePasswordModel spModel = SavePasswordModel(
        user_email: user_email,
        password: passwd,
        passwordTitle: title,
        //passwordDescription: desc,
      );
      await dbHelper.saveDataPassword(spModel).then((passwordData) {
        alertDialog(context, "Successfully Saved");
        Navigator.pushNamed(context, '/listofpassword');
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Data Save Fail");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //reverse: true,
      child: Material(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              shrinkWrap: true,
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
                        padding:
                            const EdgeInsets.only(top: 55, left: 55, right: 0),
                        child: const Text(
                          "Save Password",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:
                            const EdgeInsets.only(top: 10, left: 55, right: 0),
                        child: const Text(
                          "Save your Password in our app to keep it secure.",
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
                    "Enter Username/Email",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
                  child: TextFormField(
                    controller: _userEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username/Email cannot be empty';
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
                    "Enter Password",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
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
                    "Enter Title of Password",
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
                // const SizedBox(
                //   height: 50,
                // ),
                // Container(
                //   alignment: Alignment.topLeft,
                //   padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
                //   child: const Text(
                //     "Enter Password Description",
                //     style: TextStyle(fontSize: 22),
                //   ),
                // ),
                // Container(
                //   alignment: Alignment.topLeft,
                //   padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
                //   child: TextFormField(
                //     controller: _descriptionController,
                //     validator: (value) {
                //       if (value!.length > 500) {
                //         return 'Max. 500 Characters';
                //       }
                //       return null;
                //     },
                //     decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       //labelText: 'Full Name',
                //     ),
                //     maxLines: 40, // <-- SEE HERE
                //     minLines: 1,
                //   ),
                // ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  //width: 20,
                  //alignment: Alignment.center,
                  padding:
                      const EdgeInsets.only(top: 40, left: 120, right: 120),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 48, 73),
                    ),
                    onPressed: savePassword,
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
                  padding:
                      const EdgeInsets.only(top: 10, left: 120, right: 120),
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
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
