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
  _CreateNewAccountState createState() => _CreateNewAccountState();
  final dbHelper = DatabaseHelper.instance;
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String _user;
  String _email;
  String _password;
  String _ConfirmPassword;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
     print('records are $data');
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
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                   TextInputField(
                      icon: FontAwesomeIcons.user,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                     onSaved: (String value) {
                       _user = value;
                     },

                    ),

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
                      inputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Password is Required';
                      //   }
                      //   return null;
                      // },
                      onSaved: (String value) {
                        _password = value;
                      },
                    ),
                    PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Confirm Password is Required';
                      //   }
                      //   return null;
                      // },
                      onSaved: (String value) {
                        _ConfirmPassword = value;
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
                          'Register',
                          style: kBodyText,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewAccount()),
                          );
                          if (_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          _insert();
                          print(_user);
                          print(_email);
                          print(_password);
                          print(_ConfirmPassword);

                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
