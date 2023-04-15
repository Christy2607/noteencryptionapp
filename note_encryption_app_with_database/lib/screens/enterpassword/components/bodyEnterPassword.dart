import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/comm/comHelper.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/model/UserLoggedInModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/UserModel.dart';

class EnterPasswordBody extends StatefulWidget {
  const EnterPasswordBody({super.key});

  @override
  State<EnterPasswordBody> createState() => _EnterPasswordBodyState();
}

class _EnterPasswordBodyState extends State<EnterPasswordBody> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  enterPassword() async {
    String passwd = _passwordController.text;

    await dbHelper.getLoginUser(passwd).then((userData) {
      if (userData != null) {
        setSP(userData).whenComplete(() {
          Navigator.pushNamed(context, '/home');
        });
      } else {
        alertDialog(context, 'Error: Wrong Password');
      }
    });
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        //key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 170,
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
                      "Enter Password",
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
                      "Enter Password to enter application",
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
              padding: const EdgeInsets.only(top: 45, left: 55, right: 55),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "enter password here",
                ),
                validator: (valuePassword) {
                  if (valuePassword == null || valuePassword.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  return null;
                },
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
                onPressed: enterPassword,
                child: const Text(
                  "CONTINUE",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
