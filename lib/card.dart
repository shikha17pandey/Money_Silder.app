import 'package:flutter/material.dart';
import 'package:slide_page_app/add_money_calculator.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'package:slide_page_app/dashboard.dart';
import 'package:slide_page_app/wallet.dart';

class CreditCardsPage extends StatefulWidget {
  @override
  _CreditCardsPageState createState() => _CreditCardsPageState();
}

class _CreditCardsPageState extends State<CreditCardsPage> {

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
    AddMoneyCalculator(), //2
    CreditCardsPage() //3
  ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
          backgroundColor: Colors.white,
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

          body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildTitleSection(
                          title: "My Card",
                          subTitle: "Add some more cards"),
                      _buildCreditCard(
                          color: Color(0xFF090943),
                          cardExpiration: "08/2022",
                          cardHolder: "HOUSSEM SELMI",
                          cardNumber: "3546 653 XXXX 973"),

                      SizedBox(
                        height: 10,
                      ),

                      _buildCreditCard(
                          color: Color(0xFF000000),
                          cardExpiration: "05/2024",
                          cardHolder: "Sone ven tool",
                          cardNumber: "123 4785 XXXX 6548"),

                      SizedBox(
                        height: 10,
                      ),

                     _buildCreditCard(
                          color: Color(0xFF0040FF),
                          cardExpiration: "02/2021",
                          cardHolder: "Ruby Ven Rails",
                          cardNumber: "9874 4785 XXXX 6548"),

                     _buildCreditCard(
                          color: Color(0xFF000000),
                          cardExpiration: "06/2023",
                          cardHolder: "Penny Tea",
                          cardNumber: "846 4085 XXXX 2038"),

                     _buildCreditCard(
                            color: Color(0xFF090943),
                            cardExpiration: "06/2023",
                            cardHolder: "Leo tool",
                            cardNumber: "206 654 XXXX 8938"),

                     FlatButton(
                       child: _buildAddCardButton(
                          icon: Icon(Icons.add,
                            color: Colors.white,
                            size: 36.0,
                          ),
                          color: Color(0xFF000000),
                        ),
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => AddNewAccount()),
                         );
                       },
                     ),

                    ],
               ),
              ),
           ),
       );
  }

  Column _buildTitleSection({@required title, @required subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0),
          child: Text(
            '$title',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Text(
            '$subTitle',
            style: TextStyle(fontSize: 21, color: Colors.black45),
          ),
        )
      ],
    );
  }

  Card _buildCreditCard(
      {@required Color color,
        @required String cardNumber,
        @required String cardHolder,
        @required String cardExpiration}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildDetailsBlock(
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "images/contact.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  Column _buildDetailsBlock({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$value',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container _buildAddCardButton({
    @required Icon icon,
    @required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          print("Add a credit card");
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }
}
