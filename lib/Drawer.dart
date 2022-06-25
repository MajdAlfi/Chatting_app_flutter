import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Src/Screens/FirstUI.dart';
import 'package:untitled2/Src/Screens/Login-Signup.dart';
import 'package:untitled2/Src/Screens/Profile.dart';
import 'package:untitled2/main.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var auth = FirebaseAuth.instance.currentUser;
    var Em;
    var name;
    if (auth != null) {
      Em = auth.email;
      name = auth.displayName;
    } else {
      Em = Text("Email");
      name = Text("Name");
    }

    return SizedBox(
        width: MediaQuery.of(context).size.width *
            0.70, // 75% of screen will be occupied
        child: Drawer(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(Em),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                      fit: BoxFit.fill,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png",
                  ),
                  fit: BoxFit.cover,
                )),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () => Home(context),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () => uProfile(context),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: null,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  iconColor: Colors.red,
                  onTap: () => LogOut(context),
                ),
              ),
            ],
          ),
        ));
  }

  void Home(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => FirstUI(),
          transitionDuration: const Duration(seconds: 0)),
    );
  }

  void LogOut(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => App().Pagesx.elementAt(GroupN),
          transitionDuration: const Duration(seconds: 0)),
    );
    FirebaseAuth.instance.signOut();
  }

  void uProfile(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => prof(),
          transitionDuration: const Duration(seconds: 0)),
    );
  }
}
