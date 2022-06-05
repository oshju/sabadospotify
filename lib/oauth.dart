import 'package:flutter_web_auth/flutter_web_auth.dart';

class oauth{


 dynamic authcode()async{

    final result1=await FlutterWebAuth.authenticate(url:
    "https://id.twitch.tv/oauth2/authorize?response_type=hola&client_id=na5h83snicfs7tlxead5nznvtkw6yb&redirect_uri=http://localhost/callback&scope=channel%3Amanage%3Apolls+channel%3Aread%3Apolls&state=c3ab8aa609ea11e793ae92361f002671",
        callbackUrlScheme: "https://com.vipxam.webauthenticator-12345://callback", );
    final tokenaouth=Uri.parse(result1).queryParameters['token'];
    print('token');
    return tokenaouth;

  }
}