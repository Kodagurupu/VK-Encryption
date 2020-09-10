import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center (
          child: Padding(
            padding: EdgeInsets.only(right: 6, left: 6),
            child: Column(
              children: [
                Image.asset("lock.gif"),
                TextField(),
                TextField(),
                Row(
                  children: [
                    Spacer(),
                    MaterialButton(
                      child: Text("login"),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
