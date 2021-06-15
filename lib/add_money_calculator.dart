import 'package:flutter/material.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'main.dart';

class AddMoneyCalculator extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    String dropdownValue;
    const your_list = ["a", "b", "c", "d", "e", "f"];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // currentIndex: _selectedTabIndex,
        // onTap: _changeIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue.shade900,
              ),
              icon: Icon(
                Icons.home,
              ),
              title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet, color: Colors.grey),
              title: Text("wallet")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_sharp, color: Colors.grey),
              title: Text("calculate")),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment_outlined, color: Colors.grey),
              title: Text("My Account")),
        ],
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade200,
                                  blurRadius: 20.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(1.0, 1.0),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 64.0),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: DropdownButton(
                                hint: Center(
                                  child: Text(
                                    "Choose Category",
                                    style:
                                        TextStyle(color: Colors.blue.shade800),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.chevron_right_outlined,
                                  color: Colors.blue.shade900,
                                  size: 30.0,
                                ),
                                isExpanded: true,
                                items: your_list.map(
                                  (val) {
                                    return DropdownMenuItem(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                value: dropdownValue,
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                },
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
                          onPressed: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => moneypage()),
//                            );
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
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

  void setState(Null Function() param0) {}
}
