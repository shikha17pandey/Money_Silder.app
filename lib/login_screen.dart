import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_page_app/BackgroundImage.dart';
import 'package:slide_page_app/create_new_account.dart';
import 'package:slide_page_app/dashboard.dart';
import 'package:slide_page_app/forget_password.dart';
import 'package:slide_page_app/pallete.dart';
import 'package:slide_page_app/password.dart';
import 'package:slide_page_app/text_input_field.dart';
import 'db4_helper.dart';


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
  final dbHelper = DatabaseHelper.instance;
}

class _LoginpageState extends State<Loginpage> {

  String _email;
  String _password;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final dbHelper = DatabaseHelper.instance;

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnEmail: this._email,
      DatabaseHelper.columnPassword: this._password,


    };

    final id2 = await dbHelper.insert(row);
    var data = await dbHelper.queryAllRows();

    print('inserted row id: $id2');
    print('records are $data');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BackgroundImage(
          image: "images/add.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            key: _formKey,
            children: <Widget>[
              Flexible(
                child: Center(
                  child: Text(
                    'Money Track',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email is Required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _email = value;
                    },
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password is Required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _password = value;
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Forgot Password',
                      style: kBodyText,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: FlatButton(
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      color: kBlue,
                      child: Text(
                        'Login',
                        style: kBodyText,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        _insert();
                        print(_email);
                        print(_password);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              Container(
                child: FlatButton(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateNewAccount()),
                    );
                  },
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: kWhite),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
