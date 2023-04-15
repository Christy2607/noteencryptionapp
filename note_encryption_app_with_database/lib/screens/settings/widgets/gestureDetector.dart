import 'package:flutter/cupertino.dart';

GestureDetector gestureDetectorSettings(
    String label, IconData icon, BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              label,
              style: TextStyle(fontSize: 18),
            ),
          ),
          //Icon(Icons.arrow_forward_ios)
        ],
      ),
    ),
    //onTap: () => Navigator.pushNamed(context, route),
  );
}
