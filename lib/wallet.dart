import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:slide_page_app/add_money_calculator.dart';
import 'package:slide_page_app/card.dart';
import 'package:slide_page_app/dashboard.dart';

class Walletcard extends StatefulWidget {

  @override
  _WalletcardState createState() => _WalletcardState();
}

class _WalletcardState extends State<Walletcard> {

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


  Map<String, double> dataMap = {
  "Restaurant": 4,
  "Shopping ": 6,
  "Shopping": 6,
  "Bank": 3,
  "Flight": 4,
};

List<Color> defaultColorList = [
Color(0xFFff7675),
Color(0xFF74b9ff),
Color(0xFF55efc4),
Color(0xFFffeaa7),
Color(0xFFa29bfe),
Color(0xFFfd79a8),
Color(0xFFe17055),
Color(0xFF00b894),
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

      body:PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 2.2,
        initialAngleInDegree: 0,
        colorList: defaultColorList,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Total Expenses",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
        ),

      ),

    );

  }
}
