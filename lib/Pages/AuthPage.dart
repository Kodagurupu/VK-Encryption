import 'package:flutter/material.dart';

import 'ChatsPage.dart';
import '../Logic/VK_api.dart';

class AuthPage extends StatefulWidget
{
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
{
  Api vk;

  String login;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 12, left: 12, bottom: 24),
          child: Expanded(
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    "assets/lock.gif",
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 16,
                      left: 12,
                      right: 12
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.white70,
                              ),
                              focusedBorder: InputBorder.none,
                              fillColor: Colors.white70,
                              hoverColor: Colors.white70,
                              hintText: "Phone or login",
                              hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500)),
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                          ),
                          onChanged: ( String text )
                          {
                            setState(() {
                              login = text;
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              disabledBorder: InputBorder.none,
                              icon: Icon(
                                Icons.security,
                                color: Colors.white70,
                              ),
                              hintText: "Enter password",
                              hintStyle: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500)),
                          obscureText: true,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                          ),
                          onChanged: ( String text )
                          {
                            setState(() {
                              password = text;
                            });
                          },
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Spacer(),
                            MaterialButton(
                              child: Text(
                                "login",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: ()
                              {
                                //vk.getToken();
                                Navigator.push (
                                  context,
                                  MaterialPageRoute(
                                    builder: ( BuildContext context ) => Chats(),
                                  ),
                                );
                              },
                              color: Colors.blueGrey,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
