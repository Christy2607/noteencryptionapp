import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/screens/home/components/appBarHome.dart';
import 'package:note_encryption_app_with_database/screens/home/components/elevatedButton.dart';

class HomeNewBody extends StatelessWidget {
  const HomeNewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 73),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/setting');
          },
          child: const Icon(
            Icons.settings,
            size: 40,
          ),
        ),
        title: const Text(
          'Your Notes',
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose category to view list of notes you created. Click the Add button to add notes.',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              NoteButton(
                route: '/listofpassword',
                text: 'Password',
                route_add: '/savepassword',
              ),
              NoteButton(
                route: '/listoftext',
                text: 'Note',
                route_add: '/savetext',
              ),
              // NoteButton(
              //     route: '/listofdocument',
              //     text: 'Document',
              //     route_add: '/savedocument'),
              NoteButton(
                route: '/listofphotos',
                text: 'Photo',
                route_add: '/savephoto',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
