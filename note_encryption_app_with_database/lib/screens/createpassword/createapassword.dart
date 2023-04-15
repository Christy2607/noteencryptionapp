import 'package:flutter/material.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../comm/comHelper.dart';

class CreatePasswordBody extends StatefulWidget {
  const CreatePasswordBody({super.key});
  //final ValueChanged<String> onSubmit;

  @override
  State<CreatePasswordBody> createState() => _CreatePasswordBodyState();
}

class _CreatePasswordBodyState extends State<CreatePasswordBody> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    //String uname = _usernameController.text;
    String passwd = _passwordController.text;
    String cpasswd = _confirmPasswordController.text;

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      UserModel uModel = UserModel(passwd);
      await dbHelper.saveData(uModel).then((userData) {
        alertDialog(context, "Successfully Saved");
        Navigator.pushNamed(context, '/home');
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Data Save Fail");
      });
    }
  }

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
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
                    padding:
                        const EdgeInsets.only(top: 55, left: 55, right: 55),
                    child: const Text(
                      "Create Password",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding:
                        const EdgeInsets.only(top: 10, left: 55, right: 55),
                    child: const Text(
                      "Create your password and get started using our secure note app.",
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
                "Password",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (valuePassword) {
                  if (valuePassword == null || valuePassword.isEmpty) {
                    return 'Password cannot be empty';
                  } else if (valuePassword.length < 6 ||
                      valuePassword.length > 8) {
                    return "Password should be between 6-8 Characters";
                  } else {
                    bool result = validatePassword(valuePassword);
                    if (result) {
                      return null;
                    } else {
                      return " Password should contain capital, small letter\n & number & special character";
                    }
                  }
                  //return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
              child: const Text(
                "Confirm Password",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                validator: (valueConfirmPassword) {
                  if (valueConfirmPassword == null ||
                      valueConfirmPassword.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  print(_passwordController.text);
                  print(_confirmPasswordController.text);
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    return "Password does not match";
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
                onPressed: signUp,
                child: const Text(
                  "Confirm",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
