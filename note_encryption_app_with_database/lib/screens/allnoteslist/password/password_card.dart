import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note_encryption_app_with_database/model/SavePasswordModel.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/result_text.dart';
import 'package:note_encryption_app_with_database/screens/allnoteslist/widgets/title_text.dart';
//import 'package:note_encryption_app_with_database/model/SaveTextModel.dart';

class NotePasswordCard extends StatefulWidget {
  final int id;
  final String passwordTitle;
  final String user_email;
  final String password;
  //final String passwordDescription;

  final Function deleteFunction;
  const NotePasswordCard(
      {required this.id,
      required this.passwordTitle,
      required this.deleteFunction,
      Key? key,
      required this.user_email,
      required this.password})
      : super(key: key);

  @override
  State<NotePasswordCard> createState() => _NotePasswordCardState();
}

class _NotePasswordCardState extends State<NotePasswordCard> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var anotherPassword = SavePasswordModel(
        user_email: widget.user_email,
        password: widget.password,
        passwordTitle: widget.passwordTitle,
        //passwordDescription: widget.passwordDescription,
        id: widget.id);
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleTextWidget(
                text: 'Title: ',
              ),
              ResultTextWidget(
                text: widget.passwordTitle,
              ),
              SizedBox(
                height: 5,
              ),
              const TitleTextWidget(
                text: 'Username/Email: ',
              ),
              ResultTextWidget(
                text: widget.user_email,
              ),
              SizedBox(
                height: 5,
              ),
              const TitleTextWidget(
                text: 'Password: ',
              ),
              TextFormField(
                style: TextStyle(fontSize: 21),
                initialValue: widget.password,
                readOnly: true,
                //enabled: false,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )),
              ),
              // ResultTextWidget(
              //   text: widget.password,
              // ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),

        const Spacer(),
        IconButton(
          onPressed: () {
            widget.deleteFunction(anotherPassword);
          },
          icon: const Icon(Icons.close),
        ),
        // IconButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/home');
        //     },
        //     icon: const Icon(Icons.visibility))
      ]),
    );
  }
}
