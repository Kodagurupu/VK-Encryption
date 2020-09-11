import 'package:flutter/material.dart';

import 'MessagesPage.dart';

class ChatTemplate
{
  Image profileImage;
  String name;
  String lastMessage;

  ChatTemplate (
      this.profileImage,
      this.name,
      this.lastMessage
      );
}

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<ChatTemplate> chatList = [
    new ChatTemplate(
        Image.asset("lock.gif"),
        "Vadim",
        "How are you?"
    ),
    ChatTemplate(
        Image.asset("lock.gif"),
        "Sveta Kolesnikova",
        "I wil send docs to you tomorrow"
    ),
    ChatTemplate(
        Image.asset("lock.gif"),
        "Dima Panamarev",
        "Tomorrow you should ask m..."
    ),
    ChatTemplate(
        Image.asset("lock.gif"),
        "Katya Ivanova",
        "I wil send docs to you tomorrow"
    ),
    ChatTemplate(
        Image.asset("lock.gif"),
        "Vasya Efimov",
        "Connect to our chat"
    ),
    ChatTemplate(
        Image.asset("lock.gif"),
        "Boris Nenchenko",
        "Visit our repo at github"
    ),
    ChatTemplate(
        Image.asset("lock.gif"),
        "Elena Nikitina",
        "Good night"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your chats"),
        leading: Icon(Icons.menu),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: chatList.length,
            itemBuilder: (BuildContext context, int counter) => userNode(context, counter)
        )
      ),
    );
  }
  
  Widget userNode (BuildContext context, int counter)
  {
    ChatTemplate currentChat = chatList[counter];
    return ListTile(
      leading: Icon(
          Icons.account_circle,
          size: 42,
      ),
      title: Text(currentChat.name),
      subtitle: Text(currentChat.lastMessage),
      trailing: Icon(Icons.more_vert),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => Messages(
                User(
                    Image.asset(""),
                    "Vadim",
                    "last seen 5 seconds ago"
                ),
              ),
          ),
        );
      },
    );
  }
}
