import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'Data.dart';
import 'UserPage.dart';
import 'main.dart';

//LoginData loginData = LoginData();

void main() {
  runApp(SignupUi());
}

//Link to UserPage
class SignupUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/UserPage': (BuildContext context) => UserPage()
      },
      home: SignUpPage(),
    );
  }
}

//Data storage of registered users
//class DataBrain {
//  int _userCount = 0;
//  List<Data> _userData;
//
//  String getName() {
//    return _userData[_userCount].userName;
//  }
//
//  String getEmail() {
//    return _userData[_userCount].userEmail;
//  }
//
//  String getUserName() {
//    return _userData[_userCount].userUsername;
//  }

//Check for correct username-password combinations
//  bool isCorrect() {
//    for (int x = 0; x < _userData.length; x++) {
//      if (loginData.loginUsername == _userData[x].userUsername) {
//        if (loginData.loginPassword == _userData[x].userPassword) {
//          return true;
//        }
//        return false;
//      }
//      return false;
//    }
//    return null;
//  }
//}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //Creating validators to get proper data through FORM widget
  Widget _buildName() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Name',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
//      onSaved: (String value) {
//        if (DataBrain()._userData[DataBrain()._userCount].userName == null) {
//          DataBrain()._userData[DataBrain()._userCount].userName = value;
//        }
//        DataBrain()._userCount++;
//      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Invalid email';
        }
        return null;
      },
//      onSaved: (String value) {
//        if (DataBrain()._userData[DataBrain()._userCount].userEmail == null) {
//          DataBrain()._userData[DataBrain()._userCount].userEmail = value;
//        }
//      },
    );
  }

  Widget _buildProfession() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(labelText: 'Profession'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please mention what you do';
        }
        return null;
      },
//      onSaved: (String value) {
//        if (DataBrain()._userData[DataBrain()._userCount].userUsername ==
//            null) {
//          DataBrain()._userData[DataBrain()._userCount].userUsername = value;
//        }
//      },
    );
  }

  Widget _buildCompany() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(labelText: 'Organisation'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please mention where you work';
        }
        return null;
      },
//      onSaved: (String value) {
//        if (DataBrain()._userData[DataBrain()._userCount].userUsername ==
//            null) {
//          DataBrain()._userData[DataBrain()._userCount].userUsername = value;
//        }
//      },
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(labelText: 'Phone Number'),
      validator: (var value) {
        if (value.isEmpty) {
          return 'Contact number is required';
        }
        return null;
      },
//      onSaved: (String value) {
//        if (DataBrain()._userData[DataBrain()._userCount].userUsername ==
//            null) {
//          DataBrain()._userData[DataBrain()._userCount].userUsername = value;
//        }
//      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
//      onSaved: (String value) {
//        if (DataBrain()._userData[DataBrain()._userCount].userPassword ==
//            null) {
//          DataBrain()._userData[DataBrain()._userCount].userPassword = value;
//        }
//        DataBrain()._userCount++;
//        _buildName();
//        _buildEmail();
//        _buildUsername();
//        _buildPassword();
//      },
    );
  }

  //Defining Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/register.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Create your card',
                      style: TextStyle(color: Colors.blue[400], fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildName(),
                    _buildEmail(),
                    _buildProfession(),
                    _buildCompany(),
                    _buildPhone(),
                    _buildPassword(),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      color: Colors.blue[200],
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.blue[500],
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          _formKey.currentState.save();
                          Navigator.of(context).pushNamed('/UserPage');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
