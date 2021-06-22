import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:slide_page_app/add_money_calculator.dart';
import 'package:slide_page_app/card.dart';
import 'package:slide_page_app/color_constant.dart';
import 'package:slide_page_app/dashboard.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slide_page_app/operation_model.dart';
import 'package:slide_page_app/size_config.dart';

class Walletcard extends StatefulWidget {

  @override
  _WalletcardState createState() => _WalletcardState();
}

class _WalletcardState extends State<Walletcard> {

  int _currentIndex = 0;
  int current = 0;
  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for (var i = 0; i< list.length; i++){
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
Color(0xFF504DE5),
Color(0xFF27BEB8),
Color(0xFF0870E7),
Color(0xFFFF9500),
Color(0xFFfd79a8),
Color(0xFFa29bfe),
Color(0xFF504DE5),
Color(0xFF504DE),
];

  double percent = 50;

  double _height;
  double _width;

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
      body:SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left:10,right:10),
                child: Text(
                  'Income',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  
                ),
                
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left:10,right:10),
                child: Text(
                  '3400 rs.',
                  style: TextStyle(
                    color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),

                ),

              ),
            ),
            
            SizedBox(
              height: 40,
            ),
            PieChart(
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

            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Operations',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor),
                  ),
                  Row(
                    children: map<Widget>(
                      datas,
                          (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 123,
              child: ListView.builder(
                  itemCount: datas.length,
                  padding: EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          current = index;
                        });
                      },
                      child: OperationCard(
                        operation: datas[index].name,
                        selectedIcon: datas[index].selectedIcon,
                        unselectedIcon: datas[index].unselectedIcon,
                        isSelected: current == index,
                        context : this,
                      ),
                    );
                  }
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Column(
              children: [
                Stack(
                    children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left:10,right:10),
                    child: Text(
                      'Balance',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                ),
               Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                     "View",
                      style: TextStyle(
                        color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                  ),
                      )
                ]
              ),

                SizedBox(
                  height: 10,
                ),

                Container(
                  margin: EdgeInsets.only(left:10,right:10),
                  alignment:Alignment.topLeft,
                  child: LinearPercentIndicator( //leaner progress bar
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 20.0,
                    percent:percent/100,
                    center: Text(
                      percent.toString() + "%",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue.shade900,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              ],
            ),
        SizedBox(
          height: 40,
        ),

        Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "Targets",
                      style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                  ),
                ),

              ],
            )
          ],
          ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left:40,right:40),
              alignment:Alignment.topLeft,
              child: LinearPercentIndicator( //leaner progress bar
                animation: true,
                animationDuration: 1000,
                lineHeight: 60.0,
                percent:percent/100,
                leading: new Text("left content"),
                trailing: new Text("right content"),
                /*center: Text(
                  "Ferrari F12",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),*/
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue.shade900,
                backgroundColor: Colors.grey[300],
              ),
            ),
          ],
        ),
        ),
      ),
    );

  }
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;
  _WalletcardState context;

  OperationCard(
      { this.operation,
        this.selectedIcon,
        this.unselectedIcon,
        this.isSelected,
        this.context
      }
      );

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 123,
      height: 123,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kTenBlackColor,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8.0 , 8.0),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? kBlueColor : kWhiteColor,
      ),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unselectedIcon),
          SizedBox(height: 9),
          Text(
            widget.operation,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: widget.isSelected ? kWhiteColor : kBlueColor
            ),
          ),

        ],

      ),
    );
  }
}

