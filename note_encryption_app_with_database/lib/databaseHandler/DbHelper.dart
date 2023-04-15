import 'package:encrypt/encrypt.dart';
import 'package:note_encryption_app_with_database/model/AllNoteModel.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../model/SaveDocumentModel.dart';
import '../model/SavePasswordModel.dart';
import '../model/SavePhoto.dart';
import '../model/SavePhotoModel.dart';
import '../model/SaveTextModel.dart';
import '../model/UserLoggedInModel.dart';
import '../model/UserModel.dart';
import 'package:encrypt/encrypt.dart';

class DbHelper {
  //final _secureStorage = const FlutterSecureStorage();
  static Database? _db;
  static DbHelper? _dbHelper;

  //DbHelper._();
  static const String DB_Name = 'database2023.db';
  // static final DbHelper instance = DbHelper._init();

  static const String Table_User = 'user';
  static const String Table_Login = 'login_data';
  static const String Table_Text = 'text';
  static const String Table_Password = 'password';
  static const String Table_Photo = 'photo';
  static const String Table_Photos = 'photos';
  static const String Table_Document = 'document';
  static const String Table_AllNotes = 'all_notes';

  static const int Version = 1;

  static const String keystring = 'dededrfrfrfrfrfrfrfrqwwe';

  //ini buat user
  static const String C_UserName = 'user_name';
  static const String C_Password = 'password';

  //ini buat logged in user
  static const String C_UserNameLogin = 'user_name_login';
  static const String C_PasswordLogin = 'password_login';

  //ini buat text
  static const String C_Id = 'id';
  static const String C_TextTitle = 'textTitle';
  static const String C_TextDescription = 'textDescription';

  //ini buat password
  static const String C_UserEmail = 'user_email';
  static const String C_PasswordNote = 'password';
  static const String C_PasswordTitle = 'passwordTitle';
  static const String C_PasswordDescription = 'passwordDescription';

  //ini buat password
  static const String C_PhotoName = 'photo_name';
  static const String C_PhotoTitle = 'photoTitle';
  static const String C_PhotoDescription = 'photoDescription';

  //ini buat document
  static const String C_DocumentTitle = 'documentTitle';
  static const String C_DocumentDescription = 'documentDescription';

  //ini buat semuanya
  static const String C_Title = 'title';
  static const String C_Description = 'description';
  static const String C_Photo = 'photo';
  static const String C_Document = 'document';
  static const String C_UsernameEmail = 'usernameemail';
  static const String C_AllPassword = 'allpassword';

  String decrypt(String keyString, String encryptedData) {
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    return encrypter.decrypt(Encrypted.fromBase64(encryptedData),
        iv: initVector);
  }

  Encrypted encrypt(String keyString, String plainText) {
    final key = Key.fromUtf8(keyString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final initVector = IV.fromUtf8(keyString.substring(0, 16));
    Encrypted encryptedData = encrypter.encrypt(plainText, iv: initVector);
    return encryptedData;
  }

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  static Future initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path,
        version: Version, onCreate: _onCreate, password: "crackmeifyoucan");
    return db;
  }

  static Future _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        //" $C_UserName TEXT, "
        " $C_Password TEXT "
        ")");
    await db.execute("CREATE TABLE $Table_Login ("
        " $C_UserNameLogin TEXT, "
        " $C_PasswordLogin TEXT "
        ")");
    await db.execute("CREATE TABLE $Table_Text ("
        " $C_Id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " $C_TextTitle TEXT, "
        " $C_TextDescription TEXT "
        ")");
    await db.execute("CREATE TABLE $Table_Password ("
        " $C_Id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " $C_UserEmail TEXT, "
        " $C_PasswordNote TEXT, "
        " $C_PasswordTitle TEXT, "
        " $C_PasswordDescription TEXT "
        ")");
    // await db.execute("CREATE TABLE $Table_Photo ("
    //     " $C_PhotoName TEXT, "
    //     " $C_Id INTEGER PRIMARY KEY AUTOINCREMENT, "
    //     " $C_PhotoTitle TEXT, "
    //     " $C_PhotoDescription TEXT "
    //     ")");
    await db.execute("CREATE TABLE $Table_Photos ("
        //" $C_PhotoName TEXT, "
        " $C_Id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " $C_PhotoName TEXT "
        // " $C_PhotoTitle TEXT, "
        //" $C_PhotoDescription TEXT "
        ")");
    //await db.execute("CREATE TABLE $Table_Document ("
    //     " $C_Id INTEGER PRIMARY KEY AUTOINCREMENT, "
    //     " $C_DocumentTitle TEXT, "
    //     " $C_DocumentDescription TEXT "
    //     ")");
    // await db.execute("CREATE TABLE $Table_AllNotes ("
    //     " $C_Title TEXT, "
    //     " $C_Description  TEXT, "
    //     " $C_Photo TEXT, "
    //     " $C_Document TEXT, "
    //     " $C_UsernameEmail TEXT, "
    //     " $C_AllPassword TEXT "
    //     ")");
  }

  //ini user
  Future<int> saveData(UserModel user) async {
    user.password = encrypt("dededrfrfrfrfrfrfrfrqwwe", user.password).base64;
    var dbClient = await db;
    var res = await dbClient!.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String password) async {
    password = encrypt("dededrfrfrfrfrfrfrfrqwwe", password).base64;
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        //"$C_UserName = '$userName' AND "
        "$C_Password = '$password'");

    if (res.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }
    return null;
  }

  Future<UserLoginPasswdModel?> getLoginPasswd(String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_Password = '$password'");

    if (res.isNotEmpty) {
      return UserLoginPasswdModel.fromMap(res.first);
    }
    return null;
  }

  // ini user logged in
  // Future<int> saveDataLogin(UserLoginModel userlogin) async {
  //   var dbClient = await db;
  //   var res = await dbClient!.insert(Table_Login, userlogin.toMap());
  //   return res;
  // }

  // ini text
  Future<int> saveDataText(SaveTextModel text) async {
    text.textTitle = encrypt("dededrfrfrfrfrfrfrfrqwwe", text.textTitle).base64;
    text.textDescription =
        encrypt("dededrfrfrfrfrfrfrfrqwwe", text.textDescription).base64;
    var dbClient = await db;
    var res = await dbClient!.insert(Table_Text, text.toMap());
    return res;
  }

  // Future<List<SaveTextModel>> getTextDetail(SaveTextModel saveTextModel) async {
  //   final db1 = await db;
  //   List<Map<String, dynamic>> items = await db1!.query(
  //     'text',
  //     where: 'id == ?',
  //     whereArgs: [saveTextModel.id],
  //     orderBy: 'id DESC',
  //   );

  //   return List.generate(
  //     items.length,
  //     (i) => SaveTextModel(
  //       textTitle: items[i]['textTitle'],
  //       textDescription: items[i]['textDescription'],
  //       id: items[i]['id'],
  //     ),
  //   );
  // }

  Future<List<SaveTextModel>> getText() async {
    final db1 = await db;
    List<Map<String, dynamic>> items = await db1!.query(
      'text',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => SaveTextModel(
        textTitle: decrypt('dededrfrfrfrfrfrfrfrqwwe', items[i]['textTitle']),
        textDescription:
            decrypt('dededrfrfrfrfrfrfrfrqwwe', items[i]['textDescription']),
        id: items[i]['id'],
      ),
    );
  }

  Future<void> deleteText(SaveTextModel saveTextModel) async {
    final db1 = await db;
    await db1!.delete(
      'text',
      where: 'id == ?',
      whereArgs: [saveTextModel.id],
    );
  }

  Future<void> deletePassword(SavePasswordModel savePasswordModel) async {
    final db1 = await db;
    await db1!.delete(
      'password',
      where: 'id == ?',
      whereArgs: [savePasswordModel.id],
    );
  }

  Future<void> deleteDocument(SaveDocumentModel saveDocumentModel) async {
    final db1 = await db;
    await db1!.delete(
      'document',
      where: 'id == ?',
      whereArgs: [saveDocumentModel.id],
    );
  }

  Future<void> deletePhoto(SavePhotoModel savePhotoModel) async {
    final db1 = await db;
    await db1!.delete(
      'photo',
      where: 'id == ?',
      whereArgs: [savePhotoModel.id],
    );
  }

  Future<void> deletePhotos(SavePhoto savePhoto) async {
    final db1 = await db;
    await db1!.delete(
      'photo',
      where: 'id == ?',
      whereArgs: [savePhoto.id],
    );
  }

  Future<void> deleteUser() async {
    final db1 = await db;
    await db1!.delete(
      'user',
    );
    final db2 = await db;
    await db2!.delete(
      'photo',
    );
    final db3 = await db;
    await db3!.delete(
      'text',
    );
    final db4 = await db;
    await db4!.delete(
      'password',
    );
  }

  // ini pasword
  Future<int> saveDataPassword(SavePasswordModel password) async {
    password.password =
        encrypt("dededrfrfrfrfrfrfrfrqwwe", password.password).base64;

    password.passwordTitle =
        encrypt("dededrfrfrfrfrfrfrfrqwwe", password.passwordTitle).base64;
    password.user_email =
        encrypt("dededrfrfrfrfrfrfrfrqwwe", password.user_email).base64;
    var dbClient = await db;
    var res = await dbClient!.insert(Table_Password, password.toMap());
    return res;
  }

  Future<List<SavePasswordModel>> getPassword() async {
    final db1 = await db;
    List<Map<String, dynamic>> items = await db1!.query(
      'password',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => SavePasswordModel(
        id: items[i]['id'],
        user_email: decrypt('dededrfrfrfrfrfrfrfrqwwe', items[i]['user_email']),
        password: decrypt('dededrfrfrfrfrfrfrfrqwwe', items[i]['password']),
        passwordTitle:
            decrypt('dededrfrfrfrfrfrfrfrqwwe', items[i]['passwordTitle']),
      ),
    );
  }

  //ini photo
  // Future<int> saveDataPhoto(SavePhotoModel photo) async {
  //   photo.photo_name =
  //       encrypt("dededrfrfrfrfrfrfrfrqwwe", photo.photo_name).base64;
  //   var dbClient = await db;
  //   var res = await dbClient!.insert(Table_Photo, photo.toMap());
  //   return res;
  // }

  // Future<SavePhotoModel> savePhoto(SavePhotoModel savePhotoModel) async {
  //   var dbClient = await db;
  //   print(savePhotoModel.photo_name);
  //   savePhotoModel.id =
  //       await dbClient!.insert(Table_Photo, savePhotoModel.toMap());
  //   print(savePhotoModel.id);
  //   return savePhotoModel;
  // }

  Future<SavePhoto> savePhotos(SavePhoto savePhoto) async {
    savePhoto.photo_name =
        encrypt("dededrfrfrfrfrfrfrfrqwwe", savePhoto.photo_name).base64;
    var dbClient = await db;
    print(savePhoto.photo_name);
    savePhoto.id = await dbClient!.insert(Table_Photos, savePhoto.toMap());
    print(savePhoto.id);
    return savePhoto;
  }

  Future<List<SavePhoto>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient!.query(Table_Photos, columns: [C_Id, C_PhotoName]);
    List<SavePhoto> photos = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        var photo = SavePhoto.fromMap(Map<String, dynamic>.from(maps[i]));
        photo.photo_name = decrypt(keystring, photo.photo_name);
        photos.add(photo);
      }
    }
    print("photos {{$photos}}");
    return photos;
  }

  // Future<List<SavePhoto>> getPhoto() async {
  //   var dbClient = await db;
  //   List<Map> maps =
  //       await dbClient!.query(Table_Photo, columns: [C_Id, C_PhotoName]);
  //   List<SavePhoto> photos = [];
  //   if (maps.isNotEmpty) {
  //     for (int i = 0; i < maps.length; i++) {
  //       photos.add(SavePhoto.fromMap(Map<String, dynamic>.from(maps[i])));
  //     }
  //   }
  //   print("photos {{$photos}}");
  //   return photos;
  // }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }

  // Future<List<SavePhotoModel>> getPhoto() async {
  //   final db1 = await db;
  //   List<Map<String, dynamic>> items = await db1!.query(
  //     'photo',
  //     orderBy: 'id DESC',
  //   );

  //   return List.generate(
  //     items.length,
  //     (i) => SavePhotoModel(
  //       photo_name: items[i]['photo_name'],
  //       photoTitle: items[i]['photoTitle'],
  //       photoDescription: items[i]['photoDescription'],
  //       id: items[i]['id'],
  //     ),
  //   );
  // }

  // Future<List<SavePhotoModel>> getPhotos() async {
  //   var dbClient = await db;
  //   List<Map> maps =
  //       await dbClient!.query(Table_Photos, columns: [C_Id, C_PhotoName]);
  //   List<SavePhotoModel> photos = [];
  //   if (maps.length > 0) {
  //     for (int i = 0; i < maps.length; i++) {
  //       thephotos
  //           .add(SavePhotoModel.fromMap(Map<String, dynamic>.from(maps[i])));
  //     }
  //   }
  //   return thephotos;
  // }

  // Future<void> deletePhoto(SavePhotoModel savePhotoModel) async {
  //   final db1 = await db;
  //   await db1!.delete(
  //     'photo',
  //     where: 'id == ?',
  //     whereArgs: [savePhotoModel.id],
  //   );
  // }

  //ini document
  Future<int> saveDataDocument(SaveDocumentModel document) async {
    var dbClient = await db;
    var res = await dbClient!.insert(Table_Document, document.toMap());
    return res;
  }

  Future<List<SaveDocumentModel>> getDocument() async {
    final db1 = await db;
    List<Map<String, dynamic>> items = await db1!.query(
      'document',
      orderBy: 'id DESC',
    );

    return List.generate(
      items.length,
      (i) => SaveDocumentModel(
        // documentPath: items[i]['documentPath'],
        documentTitle: items[i]['documentTitle'],
        documentDescription: items[i]['documentDescription'],
        id: items[i]['id'],
      ),
    );
  }

  //ini semuanya
  Future<int> saveAllNotes(AllNoteModel allnote) async {
    var dbCLient = await db;
    var res = await dbCLient!.insert(Table_AllNotes, allnote.toMap());
    return res;
  }
}
