import 'package:flutter/material.dart';

class User
{
  Image userImage;
  String name;
  String lastSeen;

  User( this.userImage, this.name, this.lastSeen );
}

class Message
{
  String data;
  String message;
}

class Messages extends StatefulWidget {
  User currentUser;

  Messages(this.currentUser);

  @override
  _MessagesState createState() => _MessagesState(currentUser);
}

class _MessagesState extends State<Messages> {
  User currentUser;

  _MessagesState( this.currentUser );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                currentUser.name,
                style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                currentUser.lastSeen,
                style: TextStyle(
                  color: Colors.white24,
                  fontWeight: FontWeight.w200
                ),
              )
            ]
        )
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: 0,
              itemBuilder: (BuildContext contex, int counter) => MessageTemplate(context, counter)
          ),
          Container(
            color: Colors.white10,
            height: 200,
            child: Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter message"
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget MessageTemplate (BuildContext context, int counter)
  {
    return Container(
      color: Colors.blue,
    );
  }
}
