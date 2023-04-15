// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:note_encryption_app_with_database/comm/comHelper.dart';
// import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
// import 'package:note_encryption_app_with_database/screens/signup/components/bodySignUp.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../model/UserLoggedInModel.dart';
// import '../../model/UserModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignInBody extends StatefulWidget {
//   const SignInBody({Key? key}) : super(key: key);

//   @override
//   State<SignInBody> createState() => _SignInBodyState();
// }

// class _SignInBodyState extends State<SignInBody> {
//   final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
//   final _formKey = GlobalKey<FormState>();

//   final _userNameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   var dbHelper;

//   @override
//   void initState() {
//     super.initState();
//     dbHelper = DbHelper();
//   }

//   login() async {
//     String uname = _userNameController.text;
//     String passwd = _passwordController.text;

//     // final prefs = await SharedPreferences.getInstance();
//     // prefs.setBool('isLoggedIn', true);

//     if (_formKey.currentState!.validate()) {
//       //_formKey.currentState!.save();
//       UserModel ulModel = UserModel(uname, passwd);
//       await dbHelper.getLoginUser(uname, passwd).then((userData) {
//         if (userData != null) {
//           setSP(userData).whenComplete(() async {
//             await dbHelper.saveDataLogin(ulModel).then((userLoginData) {
//               alertDialog(context, "Login Successful");
//               Navigator.pushNamed(context, '/home');
//             });
//             Navigator.pushNamed(context, '/home');
//           });
//         } else {
//           alertDialog(context, "Error: User Not Found");
//         }
//       }).catchError((error) {
//         print(error);
//         alertDialog(context, "Error: Login Fail");
//       });
//       // await dbHelper.saveDataLogin(ulModel).then((userLoginData) {
//       //   alertDialog(context, "Successfully Saved");
//       //   Navigator.pushNamed(context, '/home');
//       // }).catchError((error) {
//       //   print(error);
//       //   alertDialog(context, "Error: Data Save Fail");
//       // });
//     }
//   }

//   Future setSP(UserModel user) async {
//     final SharedPreferences sp = await _pref;
//     sp.setString("user_name", user.user_name);
//     sp.setString("password", user.password);
//   }

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
//                       "Sign In",
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
//                       "Login and get started using our secure note app",
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
//                 controller: _userNameController,
//                 validator: (valueUsername) {
//                   if (valueUsername == null || valueUsername.isEmpty) {
//                     return 'Username cannot be empty';
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
//                 validator: (valuePassword) {
//                   if (valuePassword == null || valuePassword.isEmpty) {
//                     return 'Password cannot be empty';
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
//                 onPressed: login,
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(fontSize: 28),
//                 ),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, '/');
//                 },
//                 child: const Text(
//                   "Click Here To Sign Up",
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
