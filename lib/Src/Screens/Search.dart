import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final myController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          style:
              new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          decoration: InputDecoration(
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                filter(myController);
              },
            ),
            labelText: "Search",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            hintText: "Enter Username",
          ),
          controller: myController,
          onTap: null),
    ));
  }
}

void filter(var myCont) {
  var filteredUsers;
}
