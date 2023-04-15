import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/model/UserModel.dart';

import '../../comm/comHelper.dart';
import '../../databaseHandler/DbHelper.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  var db = DbHelper();
  // void deleteAccount(UserModel userModel) async {
  //   await db.deleteUser(userModel);
  //   setState(() {});
  // }

  deleteAccountOnTap() async {
    await db.deleteUser().then((textData) {
      alertDialog(context, "Successfully Saved");
      Navigator.pushNamed(context, '/createpassword');
    }).catchError((error) {
      print(error);
      alertDialog(context, "Error: Data Save Fail");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Container(
            height: 170,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 48, 73),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 55, left: 55, right: 0),
                  child: const Text(
                    "Settings",
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
                    "Choose what you want for your app.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //sini mulai gesture detector
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                          title: const Text("Delete Account"),
                          content: const Text(
                              "Click Yes To Delete Account. \nClick Cancel To Cancel."),
                          actions: <Widget>[
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("CANCEL"),
                                  ),
                                ),
                                TextButton(
                                  onPressed: deleteAccountOnTap,
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("YES"),
                                  ),
                                ),
                              ],
                            ),
                            // TextButton(
                            //   onPressed: deleteAccountOnTap,
                            //   child: Container(
                            //     padding: const EdgeInsets.all(14),
                            //     child: const Text("YES"),
                            //   ),
                            // ),
                          ]));
            },
            //onTapUp: deleteAccountOnTap,
            // onTap: () {
            //   deleteAccount;
            // },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Icon(Icons.no_accounts),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Delete Account",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  //Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),

          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            //width: 20,
            //alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 50, left: 120, right: 120),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 48, 73),
              ),
              child: const Text(
                "Go Back",
                style: TextStyle(fontSize: 28),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
        ],
      ),
    );
  }
}
