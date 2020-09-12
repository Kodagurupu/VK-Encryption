import 'package:flutter/material.dart';

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.security,
              size: 32,
            ),
            title: Text("Cryptography method"),
            subtitle: Text("Selected: Static password"),
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              size: 32,
            ),
            title: Text("Select language"),
            subtitle: Text("Selected: English"),
          ),
          ListTile(
            leading: Icon(
              Icons.color_lens,
              size: 32,
            ),
            title: Text("Choose you theme"),
            subtitle: Text("Selected: Dark theme"),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 32,
            ),
            title: Text("Exit from account"),
            subtitle: Text("You can exit from your VK account"),
          )
        ],
      ),
    );
  }
}
