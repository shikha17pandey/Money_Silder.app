import 'package:flutter/material.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'package:slide_page_app/login_screen.dart';
import 'package:slide_page_app/pallete.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cards;
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 20),
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(left: 20, bottom: 10),
                    child: FlatButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black54)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.chevron_left_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //card section
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Add New',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount: cards.lenght,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 199,
                    width: 344,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(cards[index].cardBackground),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 29,
                          top: 65,
                          child: Text(
                            'CARD NUMBER',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 29,
                          top: 65,
                          child: Text(
                            cards[index].cardNumber,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
