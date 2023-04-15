import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/model/SavePasswordModel.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/password/list_password_widget.dart';

import '../widgets/back_button.dart';

class ListPasswordBody extends StatefulWidget {
  const ListPasswordBody({super.key});

  @override
  State<ListPasswordBody> createState() => _ListPasswordBodyState();
}

class _ListPasswordBodyState extends State<ListPasswordBody> {
  var db = DbHelper();

  void deleteItem(SavePasswordModel savePasswordModel) async {
    await db.deletePassword(savePasswordModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        leading: const BackButtonWidget(route: '/home'),
        title: const Text(
          'Your Password Notes',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(children: [
        PasswordList(deleteFunction: deleteItem),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        onPressed: () {
          Navigator.pushNamed(context, '/savepassword');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
