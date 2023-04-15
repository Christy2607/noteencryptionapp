import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/note/notetext_card.dart';

class TextList extends StatelessWidget {
//   ScrollController _controller;

//   @override
//  void initState() {
//  _controller = ScrollController();
//  _controller.addListener(_scrollListener);//the listener for up and down.
//  super.initState();
// }

// _scrollListener() {
//   if (_controller.offset >= _controller.position.maxScrollExtent &&
//      !_controller.position.outOfRange) {
//    setState(() {//you can do anything here
//    });
//  }
//  if (_controller.offset <= _controller.position.minScrollExtent &&
//     !_controller.position.outOfRange) {
//    setState(() {//you can do anything here
//     });
//   }
// }

  final db = DbHelper();
  final Function deleteFunction;
  //final Function deleteFunction1;
  TextList({required this.deleteFunction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getText(),
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
                  itemBuilder: (context, i) => NoteTextCard(
                    id: data[i].id,
                    textTitle: data[i].textTitle,
                    textDescription: data[i].textDescription,
                    deleteFunction: deleteFunction,
                    //deleteFunction1: deleteFunction1,
                  ),
                );
        },
      ),
    );
  }
}
