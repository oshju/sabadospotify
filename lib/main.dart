import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:sabadospotify/oauth.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
dynamic code='';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
    oauth oa=new oauth();
    dynamic hola=oa.authcode();
  }
  
  /* dynamic authcode()async{
    
    final result1=await FlutterWebAuth.authenticate(url: 'https://id.twitch.tv/oauth2/authorize', callbackUrlScheme: 'http://localhost/callback');
    final tokenaouth=Uri.parse(result1).queryParameters['token'];
    print('token');
    return tokenaouth;

  }*/


  void loginWithDiscord() async {


    const clientId = '987317794515341414' ;
    const callbackUrlScheme = 'com.example.sabadospotify';
    const redirectUri = 'http://localhost'; // OR 'com.area:/';
// Construct the url

    final url = Uri.https('discord.com', '/api/oauth2/authorize', {
      'response_type': 'code',
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'scope': 'identify',
    });
// Present the dialog to the user

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: callbackUrlScheme);
// Extract code from resulting url

    final code = Uri.parse(result).queryParameters['code'];
// Use this code to get an access token

    final response = await http
        .post(Uri.parse('https://discord.com/api/oauth2/authorize'),headers: {'Content-Type': 'application/x-www-form-urlencoded'}, body: {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'grant_type': 'authorization_code',
      'code': code,
      //'Content-Type': 'application/x-www-form-urlencoded'
    });
// Get the access token from the response

    final accessToken = jsonDecode(response.body)['access_token'] as String;
    print(accessToken);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Web Auth example'),
        ),
        body: Center(
        child: new TextButton(
          child: Text('Mostrar ventana 2'),
          style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue,
          ),
            onPressed: () {
            loginWithDiscord();
    }),
    )));

  }
}