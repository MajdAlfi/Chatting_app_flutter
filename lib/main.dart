import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Cup.dart';
import 'package:untitled2/Src/Screens/FirstUI.dart';

import 'package:untitled2/Src/Screens/Login-Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    runApp(MaterialApp(home: MyApp()));
  } else {
    runApp(MaterialApp(home: FirstUI()));
  }
}
