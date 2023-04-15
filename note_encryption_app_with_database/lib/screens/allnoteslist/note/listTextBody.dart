import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/model/SaveTextModel.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/note/list.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/back_button.dart';
//import 'package:note_encryption_app_with_database/screens/home/home_new.dart';
import 'package:note_encryption_app_with_database/screens/savetext/text_card.dart';

class ListOfText extends StatefulWidget {
  //final Function deleteFunction;

  const ListOfText({super.key});

  @override
  State<ListOfText> createState() => _ListOfTextState();
}

class _ListOfTextState extends State<ListOfText> {
  var db = DbHelper();
  void deleteItem(SaveTextModel saveTextModel) async {
    await db.deleteText(saveTextModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        leading: const BackButtonWidget(route: '/home'),
        title: const Text(
          'Your Text Notes',
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: Column(
        children: [TextList(deleteFunction: deleteItem)],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        onPressed: () {
          Navigator.pushNamed(context, '/savetext');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
