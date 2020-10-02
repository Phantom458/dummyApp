import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:login_ui/my_flutter_app_icons.dart';

void main() {
  runApp(UserPage());
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/usericon.png'),
              ),
              Text(
                'Lawd He Commin',
                style: TextStyle(
                    fontFamily: 'IndieFlower',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'BITCH',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 18.0,
                  color: Colors.grey[600],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'I am a lemon',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 10.0,
                  color: Colors.grey[600],
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.grey[200],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: ListTile(
                  leading: Icon(Icons.smartphone, color: Colors.grey[800]),
                  title: Text('+975 17491632',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: 'SourceSansPro',
                          fontSize: 15)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: ListTile(
                  leading: Icon(Icons.blur_circular, color: Colors.grey[800]),
                  title: Text(
                    'user1.blogspot.com',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
