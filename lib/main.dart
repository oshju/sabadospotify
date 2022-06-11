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



  void authenticate() async {
    final String apiEndpoint =
        'https://id.twitch.tv/oauth2/token'; // Replace with your own api url
    final Uri url = Uri.parse(apiEndpoint);
    // Present the dialog to the user
    final response = await http.post(url, body: {
      'client_id': 'token',
      'client secret':'token',
      'redirect_uri': 'https://192.168.0.14:8000',
      'grant_type': 'authorization_code',
      'code': 'hola',
    });

// Extract token from resulting url
    final token = Uri.parse(response.body).queryParameters['token'];
    print('token');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Web Auth example'),
        ),
        body: Center(
          child: Text(
            'test',
          ),
        ),
      ),
    );
  }
}
