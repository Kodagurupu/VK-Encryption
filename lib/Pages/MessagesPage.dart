import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User
{
  Image userImage;
  String name;
  String lastSeen;

  User(this.userImage, this.name, this.lastSeen);
}

class Message
{
  String data;
  String message;
  bool sender;

  Message(this.data, this.message, this.sender);
}

class Messages extends StatefulWidget {
  User currentUser;

  Messages(this.currentUser);

  @override
  _MessagesState createState() => _MessagesState(currentUser);
}

class _MessagesState extends State<Messages> {
  User currentUser;
  List<Message> msgList = [
    Message(
      "10:15",
      "Hi, How are you?",
      false
    ),
    Message(
      "10:15",
      "Much better",
      true
    ),
    Message(
      "10:16",
      "Well it's nice",
      false
    ),
  ];

  _MessagesState( this.currentUser );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                  fontWeight: FontWeight.w200,
                  fontSize: 14
                ),
              )
            ]
        )
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: msgList.length,
                itemBuilder: (BuildContext context, int counter) => MessageTemplate(context, counter)
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextField(
                    minLines: 1,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Enter new message"
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.send,
                  size: 28,
                )
              ],
            ),
          ),
          SizedBox(height: 5)
        ],
      )
    );
  }
  
  Widget MessageTemplate (BuildContext context, int counter)
  {
    Message currentMessage = msgList.elementAt(counter);
    return Row(
      mainAxisAlignment: currentMessage.sender ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                bottomRight: currentMessage.sender ? Radius.circular(0) : Radius.circular(5),
                bottomLeft: currentMessage.sender ? Radius.circular(5) : Radius.circular(0)
              ),
            ),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column (
                  crossAxisAlignment: currentMessage.sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentMessage.message,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ),
                    Text (
                      currentMessage.data,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white38
                      ),
                    )
                  ],
                ),
            ),
          ),
        )
      ],
    );
  }
}
