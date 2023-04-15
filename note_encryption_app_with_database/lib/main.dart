import 'package:flutter/material.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/note/listTextBody.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/password/listPasswordBody.dart';
// import 'package:note_encryption_app_with_database/screens/allnoteslist/photo_2/listPhotosBody.dart';
//import 'package:note_encryption_app_with_database/screens/home/home_new.dart';
//import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
//import 'screens/allnotedetails/text/textDetailsBody.dart';
import 'screens/allnoteslist/document/listDocumentBody.dart';
import 'screens/allnoteslist/note/listTextBody.dart';
import 'screens/allnoteslist/password/listPasswordBody.dart';
import 'screens/allnoteslist/photo/listPhotoBody.dart';
import 'screens/allnoteslist/photo_2/listPhotosNewBody.dart';
import 'screens/createpassword/createapassword.dart';
import 'screens/enterpassword/components/bodyEnterPassword.dart';
import 'screens/home/bodyHome.dart';
import 'screens/home/body_home.dart';
import 'screens/savedocument/bodySaveDocument.dart';
import 'screens/savepassword/bodySavePassword.dart';
import 'screens/savephoto/bodySavePhoto.dart';
import 'screens/savetext/bodySaveText.dart';
import 'screens/settings/bodySettings.dart';
import 'screens/signin/bodySignIn.dart';
import 'screens/signup/components/bodySignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      home: isLoggedIn ? const EnterPasswordBody() : const CreatePasswordBody(),
      //initialRoute: '/notelist',
      //initialRoute: '/',
      routes: {
        '/savepassword': (context) => const SavePasswordBody(),
        '/savedocument': (context) => const SaveDocumentBody(),
        //'/savephoto': (context) => const SavePhotoBody(),
        '/savetext': (context) => const SaveTextBody(),
        '/setting': (context) => const SettingsBody(),
        '/enterpassword': (context) => const EnterPasswordBody(),
        '/createpassword': (contect) => const CreatePasswordBody(),
        '/home': (contect) => const HomeNewBody(),
        '/listoftext': (contect) => const ListOfText(),
        '/listofpassword': (contect) => const ListPasswordBody(),
        '/listofdocument': (contect) => const ListDocumentBody(),
        //'/listofphoto': (contect) => ListPhotoBody(),
        '/listofphotos': (contect) => ListPhotoNewBody(
              photo_name: '',
            ),
      },
    );
  }
}
