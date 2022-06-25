import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Cup.dart';
import 'package:untitled2/Src/Screens/FirstUI.dart';
import 'package:untitled2/Drawer.dart';

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return App();
  }
}

var GroupN = 0;

class App extends State<MyApp> {
  List<Widget> Pagesx = [choice2(), choice()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Pagesx.elementAt(GroupN), //New
      ),
    );
  }
}

class choice extends StatelessWidget {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Design1(),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    profilePic(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Cup(),
            SizedBox(
              height: 10,
            ),
            Login(myController, myController2),

            SizedBox(
              height: 20,
            ),
            LogButton(context, myController, myController2),

            // Padding(
            //   padding: const EdgeInsets.only(top: 130),
            //   child: Design2(),
            // ),
            ForgetPass()
          ],
        ),
      ),
    );
  }

  Widget profilePic() {
    return Center(
      child: Container(
        width: 145,
        height: 145,
        child: CircleAvatar(
          child: ClipOval(
            child: Image.network(
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              fit: BoxFit.cover,
              width: 145,
              height: 145,
            ),
          ),
        ),
      ),
    );
  }

  Widget Login(final myController, final myController2) {
    return Container(
      height: 135,
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Color.fromRGBO(255, 255, 255, 1.0)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, right: 8.0, left: 8, bottom: 15),
        child: Column(
          children: [
            TextFormField(
              style: new TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  hintText: "Email"),
              controller: myController,
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              style: new TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Password",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                hintText: "Password",
              ),
              controller: myController2,
            ),
          ],
        ),
      ),
    );
  }

  Widget Design1() {
    return Container(
      height: 200,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(110),
        ),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    );
  }

  Widget Design2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(110)),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      child: SizedBox(
        height: 87,
        width: 500,
      ),
    );
  }

  Future<void> push(
      BuildContext context, final myController, final myController2) async {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (myController.text == "" || myController2.text == "") {
      showAlertDialog(context, "Please enter the required information");
    } else if (!emailRegExp.hasMatch(myController.text)) {
      return showAlertDialog(context, "Enter a vaild Email");
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;

      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: myController.text,
          password: myController2.text,
        );
        delayPushU(context);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showAlertDialog(context, "No user found for that email.");
        } else if (e.code == 'wrong-password') {
          showAlertDialog(context, "Wrong password provided.");
        }
      }
    }
  }

  showAlertDialog(BuildContext context, String x) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text(x),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget LogButton(
      BuildContext context, final myController, final myController2) {
    return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
            color: Color.fromRGBO(255, 255, 255, 1.0)),
        child: TextButton(
          onPressed: () => push(context, myController, myController2),
          child: Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(35, 105, 137, 1.0)),
          ),
        ));
  }

  Widget ForgetPass() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 250),
      child: TextButton(
          onPressed: null,
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

class choice2 extends StatelessWidget {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Design1(),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    profilePic(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Cup(),
            SizedBox(
              height: 10,
            ),
            contSign(myController, myController2, myController3, myController4),

            SizedBox(
              height: 20,
            ),
            SubButton(context, myController, myController2, myController3,
                myController4),

            // Padding(
            //   padding: const EdgeInsets.only(top: 130),
            //   child: Design2(),
            // ),
            ForgetPass()
          ],
        ),
      ),
    );
  }

  Widget profilePic() {
    return Center(
      child: Container(
        width: 145,
        height: 145,
        child: CircleAvatar(
          child: ClipOval(
            child: Image.network(
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              fit: BoxFit.cover,
              width: 145,
              height: 145,
            ),
          ),
        ),
      ),
    );
  }

  Widget Design1() {
    return Container(
      height: 200,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(110),
        ),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    );
  }

  Widget Design2() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(110)),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      child: SizedBox(
        height: 87,
        width: 500,
      ),
    );
  }

  Widget contSign(final myController, final myController2, final myController3,
      final myController4) {
    return Container(
      height: 240,
      width: 360,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Color.fromRGBO(255, 255, 255, 1.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black87),
                    decoration: InputDecoration(
                        labelText: "F.Name",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        hintText: "First Name"),
                    controller: myController,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    cursorColor: Colors.black87,
                    style: new TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black87),
                    decoration: InputDecoration(
                        labelText: "L.Name",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        hintText: "Last Name"),
                    controller: myController2,
                  ),
                ),
              ],
            ),
            TextFormField(
              style: new TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  hintText: "Email"),
              controller: myController3,
            ),
            TextFormField(
              style: new TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Password",
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                hintText: "Password",
              ),
              controller: myController4,
            ),
          ],
        ),
      ),
    );
  }

  Widget SubButton(BuildContext context, final myController,
      final myController2, final myController3, final myController4) {
    return Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
            color: Color.fromRGBO(255, 255, 255, 1.0)),
        child: TextButton(
          onPressed: () => push(context, myController, myController2,
              myController3, myController4),
          child: Text(
            "SignUp",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(35, 105, 137, 1.0)),
          ),
        ));
  }

  Future push(BuildContext context, final myController, final myController2,
      final myController3, final myController4) async {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (myController.text == "" ||
        myController2.text == "" ||
        myController3.text == "" ||
        myController4.text == "") {
      showAlertDialog(context, "Please enter the required information");
    } else if (!emailRegExp.hasMatch(myController3.text)) {
      return showAlertDialog(context, "Enter a vaild Email");
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: myController3.text,
          password: myController4.text,
        );
        delayPushU(context);
        addUser();
        user = userCredential.user;

        await user!.updateProfile(
            displayName: myController.text + " " + myController2.text);
        await user.reload();
        user = auth.currentUser;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showAlertDialog(context, "The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          showAlertDialog(
              context, 'The account already exists for that email.');
        }
      } catch (e) {
        showAlertDialog(context, e.toString());
      }
      return user;
    }
  }

  Future<void> addUser() {
    FirebaseAuth auth = FirebaseAuth.instance;
    var u = auth.currentUser?.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Call the user's CollectionReference to add a new user
    return users
        .doc(u)
        .set({
          'FName': myController.text,
          'LName': myController2.text,
          'profilePicURL': "url",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  showAlertDialog(BuildContext context, String x) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text(x),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget ForgetPass() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 250),
      child: TextButton(
          onPressed: null,
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

Future delayPushU(BuildContext context) async {
  await new Future.delayed(new Duration(milliseconds: 1500), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FirstUI()),
    );
  });
}
