import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:login_ui/UserPage.dart';
import 'signup.dart';
import 'my_flutter_app_icons.dart';

//DataBrain dataBrain = DataBrain();

void main() {
  runApp(LoginUi());
}

class LoginUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //creating routes to link other pages
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignUpPage(),
        '/UserPage': (BuildContext context) => UserPage()
      },
      home: LoginPage(),
    );
  }
}

//Class for signup page to compare data
class LoginData {
  String loginUsername;
  String loginPassword;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Creating validators to get proper data through FORM widget
  Widget _checkName() {
    return TextFormField(
      style: TextStyle(color: Colors.teal[300]),
      decoration: InputDecoration(
        hintText: 'UserName',
        hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
        prefixIcon: Icon(Icons.people, color: Colors.teal[300]),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }
        return null;
      },
      onSaved: (String value) {
        LoginData().loginUsername = value;
        print(LoginData().loginUsername);
      },
    );
  }

  Widget _checkPassword() {
    return TextFormField(
      style: TextStyle(color: Colors.teal[300]),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
        prefixIcon: Icon(Icons.lock, color: Colors.teal[300]),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value) {
        LoginData().loginPassword = value;
      },
    );
  }

  final GlobalKey<FormState> _userKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 185,
                ),
                Text(
                  'The Card',
                  style: TextStyle(color: Colors.teal, fontSize: 40.0),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  child: Form(
                    key: _userKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _checkName(),
                          _checkPassword(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.teal[200],
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  onPressed: () {
                    if (!_userKey.currentState.validate()) {
                      return;
                    }
                    _userKey.currentState.reset();
//                  if (dataBrain.isCorrect() == true) {
                    Navigator.of(context).pushNamed('/UserPage');
//                  }
                    AlertDialog(
                      title: Text('Error'),
                      content: Text(
                          'Incorrect Username or Password. Please try again'),
                    );
                  },
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          color: Colors.black45,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
