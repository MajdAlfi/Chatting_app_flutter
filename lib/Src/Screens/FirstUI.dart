import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled2/Src/Screens/ChatLog.dart';
import 'package:untitled2/Src/Screens/Search.dart';
import 'package:untitled2/main.dart';

import 'package:untitled2/Drawer.dart';

import '../../Mocks/Mock_data.dart';

class FirstUI extends StatefulWidget {
  State<StatefulWidget> createState() {
    return First();
  }
}

var name;

class First extends State<FirstUI> {
//   First({Key? key}) : super(key: key);
  int selected = 0;
  int indexx = 0;
  var auth = FirebaseAuth.instance.currentUser;

  static List<Widget> Pages = [Chat(), Search()];
  @override
  Widget build(BuildContext context) {
    if (auth != null) {
      Future.delayed(const Duration(seconds: 2));
      name = auth?.displayName;
    } else {
      name = Text("Name");
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
//        leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: null,),
          title: Text(name.toString()),
          flexibleSpace: Image(
              image: NetworkImage(
                  "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png"),
              fit: BoxFit.cover),
          elevation: 0,
        ),
        drawer: drawer(),
        body: Center(
          child: Pages.elementAt(selected), //New
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],
          elevation: 0,
          currentIndex: selected, //New
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }
}

class Chat extends StatefulWidget {
  State<StatefulWidget> createState() {
    return ChatList();
  }
}

class ChatList extends State<Chat> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: mockData.length,
        itemBuilder: (context, index) => builder(context, index),
        separatorBuilder: (context, index) => SizedBox(
          height: 0,
        ),
      ),
    );
  }
}

Widget builder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      push(
          context,
          chatLogful(
              name: mockData[index]["first_name"].toString(),
              imgUrl: mockData[index]["profileImage"].toString()));
    },
    child: Container(
      height: 100,
      width: 300,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                mockData[index]["profileImage"].toString(),
              ),
              radius: 40,
            ),
          ),
          Positioned(
            top: 8,
            left: 105,
            child: Container(
              child: Text(
                mockData[index]["first_name"].toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 105,
            child: Container(
              child: Text(
                "Text Message",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void push(BuildContext context, myController) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => myController),
  );
}
