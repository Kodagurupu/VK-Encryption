import 'package:flutter/material.dart';

import 'Encryption.dart';
import 'Encryption/keys.dart';

import 'dart:convert';
import 'dart:io';
//import 'package:http/http.dart';
import 'package:dio/dio.dart';

const auth_path = "https://login.vk.com";
const client_id = "7586493";
const oauth = "/authorize";
const oauth_page = "https://oauth.vk.com";
const methods = "/method";
const methods_page = "api.vk.com";
const redirect_page = "oauth.vk.com/blank.html";

class Api {

  Future<dynamic> _get(String page) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get(page);
    return response.data.toString();
  }

  Future<dynamic> _post(String url, Map<String, dynamic> params) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(
        url,
        data: FormData.fromMap(params),
    );
    return response.data.toString();
  }

  Encryption encryption = new Encryption(Methods(true, true, true, true));

  Future login(String username, String password, BuildContext context) async {
    var page = await _get("https://oauth.vk.com/authorize?client_id=7586493&redirect_uri=oauth.vk.com/blank.html&response_type=token&scope=4096&v=&state=&revoke=1&m=4&email=+79780398794");
    List<String> ip_h = page.toString().split("<input type=\"hidden\" name=\"ip_h\" value=\"");
    List<String> lg_h = page.toString().split("<input type=\"hidden\" name=\"lg_h\" value=\"");
    List<String> to = page.toString().split("<input type=\"hidden\" name=\"to\" value=\"");
    
    ip_h = ip_h[1].split("\" />");
    lg_h = lg_h[1].split("\" />");
    to = to[1].split("\">");

    Map<String, dynamic> params = {
      "_origin": "https://oauth.vk.com",
      "ip_h": ip_h[0],
      "lg_h": lg_h[0],
      "to": to[0],
      "email": username,
      "pass": password
    };

    page = await _post("https://login.vk.com/?act=login&soft=1&utf8=1", params);
    //page = await _post("https://oauth.vk.com/authorize?client_id=7586493&redirect_uri=oauth.vk.com%2Fblank.html&response_type=token&scope=4096&v=&state=&revoke=1&display=page&m=4&email=", params);

    List<String> is2Auth = page.toString().split("<div class=\"basis__content mcont \" id=\"mcont\" data-canonical=\"https://vk.com/login?act=authcheck\">");
    if (is2Auth.length > 1)
    {
      showDialog(context: context, builder: (BuildContext context) => AlertDialog(
        title: Text("VK security"),
        content: TextField(
          decoration: InputDecoration(
            hintText: "Enter access code",
            prefixIcon: Icon(Icons.security)
          ),
          obscureText: true,
        ),
      ));
     }

    return page;
  }

  Future<dynamic> getToken(String username, String password, BuildContext context) {
    login(username, password, context);
  }

  sendMessage(String message) {
    Map<String, String> params = {};
    //Future<String> responce = _get("/method", params);
    encryption.encrypt("Few words");
  }
}
