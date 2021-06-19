import 'package:flutter/material.dart';
import 'package:slide_page_app/dashboard.dart';
import 'db_helper.dart';

class AddNewAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    final dbHelper = DatabaseHelper.instance;
    return AddNewAccountState();
  }
}

class AddNewAccountState extends State<AddNewAccount> {
  String _name;
  String _number;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        // alignment: Alignment.center,
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Colors.blue.shade900,
              style: BorderStyle.solid,
            ),
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Account Name',
              hintStyle: TextStyle(color: Colors.blue.shade900),
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Account Name is Required';
              }
              return null;
            },
            onSaved: (String value) {
              _name = value;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
      child: Container(
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: Colors.blue.shade900,
              style: BorderStyle.solid,
            ),
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Account Number',
              hintStyle: TextStyle(color: Colors.blue.shade900),
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Account Number is Required';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            onSaved: (String value) {
              _number = value; //num.tryParse(value);
            },
          ),
        ),
      ),
    );
  }

  final dbHelper = DatabaseHelper.instance;

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: this._name,
      DatabaseHelper.columnNumber: this._number,
    };
    final id = await dbHelper.insert(row);
    var data = await dbHelper.queryAllRows();
    print('inserted row id: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors : [Colors.blue[900], Colors.blue[800]])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: Text(
                          'New Account',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 100),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildName(),
                            _buildNumber(),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 70),
                                child: FlatButton(
                                    height: 50.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)),
                                    color: Colors.blue.shade900,
                                    child: Text(
                                      'ADD',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (!_formKey.currentState.validate()) {
                                        return;
                                      }
                                      _formKey.currentState.save();
                                      _insert();
                                      print(_name);
                                      print(_number);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dashboard()),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
