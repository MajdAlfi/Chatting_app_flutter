import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:untitled2/Mocks/Mock_messages.dart';

class chatLogful extends StatefulWidget {
  chatLogful({Key? key, required this.name, required this.imgUrl})
      : super(key: key);
  final String name;
  final String imgUrl;
  @override
  State<StatefulWidget> createState() => chat(name: name, imgUrl: imgUrl);
}

class chat extends State<chatLogful> {
  chat({Key? key, required this.name, required this.imgUrl});
  final String name;
  final String imgUrl;
  final myController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
//        leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: null,),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    imgUrl,
                  ),
                  radius: 20,
                ),
              ),
              Text(name.toString()),
            ],
          ),
        ),
        flexibleSpace: Image(
            image: NetworkImage(
                "https://images.saymedia-content.com/.image/t_share/MTc4NzM1OTc4MzE0MzQzOTM1/how-to-create-cool-website-backgrounds-the-ultimate-guide.png"),
            fit: BoxFit.cover),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            child: ListView.separated(
                itemCount: mockMessage.length,
                itemBuilder: (context, index) => builder(context, index),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 0)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.add,
                            color: Colors.black54,
                          )),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Text",
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            hintText: "Type Here",
                          ),
                          onTap: null,
                          controller: myController,
                        ),
                      ),
                      IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () => null,
                          icon: Icon(
                            Icons.send,
                            color: Colors.indigo,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget builder(BuildContext context, int index) {
  if (mockMessage[index]["fromid"].toString() == "1") {
    if (mockMessage[index]["told"].toString() == "2") {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: BubbleSpecialThree(
              text: mockMessage[index]["Message"].toString(),
              color: Color(0xFF1B97F3),
              tail: false,
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      );
    } else {
      return Text("");
    }
  } else {
    return Text("");
  }
}



// Define a corresponding State class.
// This class holds the data related to the Form.
