import 'package:flutter/material.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'package:slide_page_app/card.dart';
import 'package:slide_page_app/dashboard.dart';
import 'package:slide_page_app/db2_helper.dart';
import 'package:slide_page_app/wallet.dart';
import 'main.dart';

class AddMoneyCalculator extends StatefulWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  _AddMoneyCalculatorState createState() => _AddMoneyCalculatorState();
  final dbHelper = DatabaseHelper.instance;
}

class _AddMoneyCalculatorState extends State<AddMoneyCalculator> {
  String _subjects;
  int _currentIndex = 0;

  _onTap() {
    // this has changed
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (
        BuildContext context) => _children[_currentIndex])); // this has changed
  }

  final List<Widget> _children = [
    Dashboard(), //0
    Walletcard(), //1
    AddMoneyCalculator(),
    CreditCardsPage() //2
  ];

  final dbHelper = DatabaseHelper.instance;

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnSubjects: this._subjects,
    };

    final id = await dbHelper.insert(row);

    print('inserted row id: $id');
  }

  @override
  Widget build(BuildContext context) {

    const deviceTypes = ["Bank", "Shopping", "Flight Ticket", "Payment Received", "Online Shopping"];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade900,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            // backgroundColor: Colors.black,

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Wallet'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_sharp),
            title: Text('Calculate'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            title: Text('Credit Card'),
          )
        ],

        onTap: (index) { // this has changed
          setState(() {
            _currentIndex = index;
          });
          _onTap();
        },
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.blue[900], Colors.blue[800]])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(left: 20, bottom: 10),
                    child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)),
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.chevron_left_outlined,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    'New Expences',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Enter Amount",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          // helperText: 'Helper Text',
                          // helperStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      // width: double.infinity,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              color: Colors.white,
                            ),

                           margin: EdgeInsets.only(top: 20.0),

                            // child: Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 20.0, right: 20.0),
                            //   child: DropdownButton(
                            //     hint: Center(
                            //       child: Text(
                            //         "Choose Category",
                            //         style:
                            //         TextStyle(color: Colors.blue.shade800),
                            //       ),
                            //     ),
                            //     icon: Icon(
                            //       Icons.chevron_right_outlined,
                            //       color: Colors.blue.shade900,
                            //       size: 30.0,
                            //     ),
                            //     isExpanded: true,
                            //     items: your_list.map(
                            //           (val) {
                            //         return DropdownMenuItem(
                            //           value: val,
                            //           child: Text(val),
                            //         );
                            //       },
                            //     ).toList(),
                            //     value: dropdownValue,
                            //     onChanged: (value) {
                            //       setState(() {
                            //         dropdownValue = value;
                            //         print(dropdownValue);
                            //       });
                            //     },
                            //   ),
                            // ),
                              child: InputDecorator(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Center(
                                      child: Text(
                                        "Choose Category",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.chevron_right_outlined,
                                      color: Colors.blue.shade900,
                                      size: 30.0,
                                    ),
                                    value: _subjects,
                                    isDense: true,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _subjects = newValue;
                                      });
                                      print(_subjects);
                                    },
                                    items: deviceTypes.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),),
                                      );
                                    }).toList(),

                                  ),

                                ),
                              ),

                          ),
                        ],
                      ),
                    ),



                    SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: FlatButton(
                          height: 50.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          color: Colors.blue.shade900,
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _insert();
                            print(_subjects);
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => Dashboard()),
                           );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}