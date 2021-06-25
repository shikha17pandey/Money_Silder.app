import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_page_app/BackgroundImage.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'package:slide_page_app/db3_helper.dart';
import 'package:slide_page_app/login_screen.dart';
import 'package:slide_page_app/pallete.dart';
import 'package:slide_page_app/password.dart';
import 'package:slide_page_app/rounder_button.dart';
import 'package:slide_page_app/text_input_field.dart';


class CreateNewAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    final dbHelper = DatabaseHelper.instance;
    return _CreateNewAccountState();
  }
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String _user;
  String _email;
  String _password;
  String _ConfirmPassword;

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

   final dbHelper = DatabaseHelper.instance;

   void _insert() async {
     // row to insert
     Map<String, dynamic> row = {
       DatabaseHelper.columnUser: this._user,
       DatabaseHelper.columnEmail: this._email,
       DatabaseHelper.columnPassword: this._password,
       DatabaseHelper.columnConfirmPassword: this._ConfirmPassword,

     };

     final id1 = await dbHelper.insert(row);
     var data = await dbHelper.queryAllRows();

     print('inserted row id: $id1');
     print('record1 are $data');
   }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: "images/hpp.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            filled: true,
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your full name',
                            labelText: 'Name'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Name is Required';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          _user = value;
                        },
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.mail_outline),
                              hintText: 'Enter the user Email ID',
                              labelText: 'Email ID'
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email Id is Required';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            _email = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.lock),
                              hintText: 'Enter the Paswword',
                              labelText: 'Password'
                          ),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              filled: true,
                              icon: const Icon(Icons.lock),
                              hintText: 'Enter the Confirm Paswword',
                              labelText: 'Confirm Password'
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password is Required';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            _ConfirmPassword = value;
                          },
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.white)),
                        color: kBlue,
                        child: Text('Register',
                          style: kBodyText,
                        ),
                        onPressed: () {
                          if (!_formKey1.currentState.validate()) {
                            return;
                          }
                          _formKey1.currentState.save();

                          //  var insertDb2 = insertDb(_name, _age, currentSelectedValue, course);
                          _insert();
                          print(_user);
                          print(_email);
                          print(_password);
                          print(_ConfirmPassword);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewAccount()),
                          );


                        },
                      ),

                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        FlatButton(
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
