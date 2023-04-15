// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
// import 'package:note_encryption_app_with_database/model/UserModel.dart';
// //import 'dart:async';
// // import 'dart:async';
// // import 'dart:io' as io;
// // import 'package:path/path.dart';
// //import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../../../comm/comHelper.dart';

// class SignUpBody extends StatefulWidget {
//   const SignUpBody({super.key});
//   //final ValueChanged<String> onSubmit;

//   @override
//   State<SignUpBody> createState() => _SignUpBodyState();
// }

// class _SignUpBodyState extends State<SignUpBody> {
//   final _formKey = GlobalKey<FormState>();
//   //ini controller buat textfield
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   var dbHelper;

//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DbHelper();
//   }

//   signUp() async {
//     String uname = _usernameController.text;
//     String passwd = _passwordController.text;
//     String cpasswd = _confirmPasswordController.text;

//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       UserModel uModel = UserModel(uname, passwd);
//       await dbHelper.saveData(uModel).then((userData) {
//         alertDialog(context, "Successfully Saved");
//         Navigator.pushNamed(context, '/signin');
//       }).catchError((error) {
//         print(error);
//         alertDialog(context, "Error: Data Save Fail");
//       });
//     }
//   }

//   RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
//   //A function that validate user entered password
//   bool validatePassword(String pass) {
//     String _password = pass.trim();
//     if (pass_valid.hasMatch(_password)) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   TextEditingController password = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();

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
//                 // borderRadius: BorderRadius.only(
//                 //   bottomLeft: Radius.circular(20),
//                 //   bottomRight: Radius.circular(20),
//                 // ),
//               ),
//               child: ListView(
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding:
//                         const EdgeInsets.only(top: 55, left: 55, right: 55),
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         fontSize: 45,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding:
//                         const EdgeInsets.only(top: 10, left: 55, right: 55),
//                     child: const Text(
//                       "Create your account and get started using our secure note app.",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
//               child: const Text(
//                 "Username",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
//               child: TextFormField(
//                 controller: _usernameController,
//                 validator: (valueUsername) {
//                   if (valueUsername == null || valueUsername.isEmpty) {
//                     return 'Username cannot be empty';
//                   } else if (valueUsername.length < 5) {
//                     return "Username should be Min. 5 Characters";
//                   } else if (valueUsername.length > 15) {
//                     return "Username should be Max. 15 Characters";
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
//               child: const Text(
//                 "Password",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
//               child: TextFormField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 validator: (valuePassword) {
//                   if (valuePassword == null || valuePassword.isEmpty) {
//                     return 'Password cannot be empty';
//                   } else if (valuePassword.length < 6 ||
//                       valuePassword.length > 8) {
//                     return "Password should be between 6-8 Characters";
//                   } else {
//                     bool result = validatePassword(valuePassword);
//                     if (result) {
//                       return null;
//                     } else {
//                       return " Password should contain Capital, small letter\n & Number & Special";
//                     }
//                   }
//                   //return null;
//                 },
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
//               child: const Text(
//                 "Confirm Password",
//                 style: TextStyle(fontSize: 22),
//               ),
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.only(top: 5, left: 55, right: 55),
//               child: TextFormField(
//                 controller: _confirmPasswordController,
//                 obscureText: true,
//                 validator: (valueConfirmPassword) {
//                   if (valueConfirmPassword == null ||
//                       valueConfirmPassword.isEmpty) {
//                     return 'Password cannot be empty';
//                   }
//                   print(_passwordController.text);
//                   print(_confirmPasswordController.text);
//                   if (password.text != confirmpassword.text) {
//                     return "Password does not match";
//                   }
//                   return null;
//                 },
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
//                 onPressed: signUp,
//                 child: const Text(
//                   "Register",
//                   style: TextStyle(fontSize: 28),
//                 ),
//                 // onPressed: () {
//                 //   if (_formKey.currentState!.validate()) {
//                 //     _formKey.currentState?.save();
//                 //     UserModel uModel = UserModel(uname, pass)
//                 //     ScaffoldMessenger.of(context).showSnackBar(
//                 //       const SnackBar(content: Text('Processing Data')),
//                 //     );
//                 //   }
//                 // },
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/signin');
//                 },
//                 child: const Text(
//                   "Click Here To login",
//                   style: TextStyle(
//                     fontSize: 19,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
