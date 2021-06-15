import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_page_app/BackgroundImage.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'package:slide_page_app/card.dart';
import 'package:slide_page_app/create_new_account.dart';
import 'package:slide_page_app/dashboard.dart';
import 'package:slide_page_app/forget_password.dart';
import 'package:slide_page_app/home_page.dart';
import 'package:slide_page_app/pallete.dart';
import 'package:slide_page_app/password.dart';
import 'package:slide_page_app/rounder_button.dart';
import 'package:slide_page_app/text_input_field.dart';
import 'package:slide_page_app/main.dart';
import 'main.dart';

class Loginpage extends StatelessWidget {
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
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
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
                          MaterialPageRoute(builder: (context) => CreditCardsPage()),
                        );
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
