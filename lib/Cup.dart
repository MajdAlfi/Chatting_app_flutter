import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Src/Screens/Login-Signup.dart';
import 'package:untitled2/main.dart';

class Cup extends StatefulWidget {
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Cup> {
  Map<int, Widget> children = <int, Widget>{
    0: Text(
      "SignUp",
      style: TextStyle(
          color: Color.fromRGBO(35, 105, 137, 1.0),
          fontWeight: FontWeight.bold),
    ),
    1: Text(
      "Login",
      style: TextStyle(
          color: Color.fromRGBO(35, 105, 137, 1.0),
          fontWeight: FontWeight.bold),
    ),
  };

  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(30),
        )),
        child: CupertinoSlidingSegmentedControl<int>(
          groupValue: GroupN,
          children: children,
          onValueChanged: (int? Num) {
            setState(() {
              GroupN = Num!;
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (_, __, ___) => App().Pagesx.elementAt(GroupN),
                    transitionDuration: const Duration(seconds: 0)),
              );
            });
          },
          thumbColor: CupertinoColors.white,
          padding: EdgeInsets.all(8),
          backgroundColor: CupertinoColors.white,
        ));
  }
}
