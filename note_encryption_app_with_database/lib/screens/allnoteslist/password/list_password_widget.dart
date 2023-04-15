import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../databaseHandler/DbHelper.dart';
import 'password_card.dart';

class PasswordList extends StatelessWidget {
  final db = DbHelper();
  final Function deleteFunction;
  PasswordList({required this.deleteFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getPassword(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? const Center(
                  child: Text('no data found'),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => NotePasswordCard(
                    id: data[i].id,
                    passwordTitle: data[i].passwordTitle,
                    user_email: data[i].user_email,
                    password: data[i].password,
                    //passwordDescription: data[i].passwordDescription,
                    deleteFunction: deleteFunction,
                  ),
                );
        },
      ),
    );
  }
}
