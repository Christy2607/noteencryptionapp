import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/databaseHandler/DbHelper.dart';
import 'package:sqflite/sqflite.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  DbHelper databaseHelper = DbHelper();
  // late List<Notes> notesList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 0),
        height: 90,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 48, 73),
        ),
        child: Row(children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/setting');
              },
              child: const Icon(
                Icons.settings,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 30),
          const Text(
            "Your Notes",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 30),
          PopupMenuButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).copyWith(
                topRight: const Radius.circular(0),
              ),
            ),
            padding: const EdgeInsets.all(10),
            elevation: 10,
            color: Colors.white,
            onSelected: ((value) {
              Navigator.pushNamed(context, value.toString());
            }),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    // onTap: () {
                    //   Navigator.pushNamed(context, '/savepassword');
                    // },
                    padding: EdgeInsets.only(right: 50, left: 20),
                    value: '/savepassword',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 30,
                              color: Color.fromARGB(255, 0, 48, 73),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Add Password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 73),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Divider()
                      ],
                    )),
                PopupMenuItem(
                    padding: EdgeInsets.only(right: 50, left: 20),
                    value: '/savetext',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 30,
                              color: Color.fromARGB(255, 0, 48, 73),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Add Note',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 73),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        // Divider()
                      ],
                    )),
                PopupMenuItem(
                    padding: EdgeInsets.only(right: 50, left: 20),
                    value: '/savedocument',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 30,
                              color: Color.fromARGB(255, 0, 48, 73),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Add Document',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 73),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        //Divider()
                      ],
                    )),
                PopupMenuItem(
                    padding: const EdgeInsets.only(right: 50, left: 20),
                    value: '/savephoto',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.add,
                              size: 30,
                              color: Color.fromARGB(255, 0, 48, 73),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Add Photo',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 48, 73),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    )),
              ];
            },
          )
        ]),
      ),
      // ListView.builder(
      //   itemBuilder: ((context, index) {
      //     //      scrollDirection: Axis.vertical,
      //     // shrinkWrap: true,
      //     return Card(
      //       child: Column(
      //         children: <Widget>[
      //           Text('sometitle'),
      //           Text('some text'),
      //         ],
      //       ),
      //     );
      //   }),
      // ),
    ]));
  }
}
