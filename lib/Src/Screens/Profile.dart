import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled2/Drawer.dart';

class prof extends StatelessWidget {
  var auth = FirebaseAuth.instance.currentUser;
  var Em;
  var name;

  Widget build(BuildContext context) {
    if (auth != null) {
      Em = auth?.email;
      name = auth?.displayName;
    } else {
      Em = Text("Email");
      name = Text("Name");
    }
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: drawer(),
      body: Stack(
        children: [
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                )),
          ),
          Positioned(
              top: 150,
              left: 30,
              child: Text(
                "TechChat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              )),
          SizedBox(
            height: 1000,
          ),
          Positioned(
            top: 200,
            left: wid * 0.5 - 70,
            child: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://freeiconshop.com/wp-content/uploads/edd/chat-alt-flat.png",
                  fit: BoxFit.cover,
                ),
              ),
              radius: 70,
            ),
          ),
          design()
        ],
      ),
    );
  }

  Widget design() {
    return Positioned(
      top: 380,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png"),
                fit: BoxFit.fill)),
        width: 330,
        height: 330,
        child: Stack(
          children: [
            Positioned(
                top: 140,
                left: 30,
                child: Text(
                  name.toString(),
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Positioned(
                top: 190,
                left: 30,
                child: Text(
                  Em.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            Positioned(
                top: 260,
                left: 140,
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text("Change Password",
                      style: TextStyle(color: Colors.white)),
                  icon: Icon(
                    Icons.change_circle,
                    color: Colors.white,
                  ),
                )),
            Positioned(
              top: 30,
              left: 200,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                    fit: BoxFit.fill,
                  ),
                ),
                radius: 40,
              ),
            ),
            Positioned(
                top: 100,
                left: 182,
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text("Change", style: TextStyle(color: Colors.white)),
                  icon: Icon(
                    Icons.change_circle,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
