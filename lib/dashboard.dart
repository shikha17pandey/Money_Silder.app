import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_page_app/add_money_calculator.dart';
import 'package:slide_page_app/add_new_account.dart';
import 'package:slide_page_app/card.dart';
import 'package:slide_page_app/color_constant.dart';
import 'package:slide_page_app/credit_card.dart';
import 'package:slide_page_app/credit_cards.dart';
import 'package:slide_page_app/login_screen.dart';
import 'package:slide_page_app/main.dart';
import 'package:slide_page_app/operation_model.dart';
import 'package:slide_page_app/pallete.dart';
import 'package:slide_page_app/transaction_model.dart';
import 'package:slide_page_app/wallet.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int current = 0;

  List<T> map<T>(List list, Function handler){
    List<T> result = [];
    for (var i = 0; i< list.length; i++){
      result.add(handler(i, list[i]));
    }
     return result;
  }

  int _currentIndex = 0;

  _onTap() { // this has changed
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => _children[_currentIndex])); // this has changed
  }

  final List<Widget> _children = [
    Dashboard(), //0
    Walletcard(),//1
    AddMoneyCalculator(),//2
    CreditCardsPage()//3
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

        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[

              // Custom AppBar
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        print('Drawer Tapped!');
                      },
                        child: SvgPicture.asset('assets/svg/drawer_icon.svg')),
                    Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('images/user_image.jpg'),
                        ),
                      ),
                    ),
                            // Padding(
                    //   padding: EdgeInsets.only(left: 16, bottom: 16),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       Text(
                    //         'Good Morning',
                    //         style: GoogleFonts.inter(
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w500,
                    //             color: kBlackColor),
                    //       ),
                    //       Text(
                    //         'Amanda Alex',
                    //         style: GoogleFonts.inter(
                    //             fontSize: 30,
                    //             fontWeight: FontWeight.w700,
                    //             color: kBlackColor),
                    //       )
                    //     ],
                    //   ),
                    // ),
                  ], //<Widget>
                ),
              ),

              // Card Section
              SizedBox(
               // height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16,bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cards',
                      style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                    ),
                    Text(
                      'Add New',
                      style: GoogleFonts.inter(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: kBlackColor,
                      ), //style
                    ),
                  ],//<Widget>
                ),
              ),

              Container(
                height: 199,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16, right: 6),
                  itemCount: cards.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 199,
                      width: 344,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Color(cards[index].cardBackground),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              child: SvgPicture.asset(cards[index].cardElementTop),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                              child: SvgPicture.asset(cards[index].cardElementBottom),
                          ),
                          Positioned(
                            left: 29,
                            top: 48,
                            child: Text(
                              'CARD NUMBER',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            top: 65,
                            child: Text(
                              cards[index].cardNumber,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            right: 21,
                            top: 35,
                            child: Image.asset(
                              cards[index].cardType,
                              width: 27,
                              height: 27,
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 45,
                            child: Text(
                              'CARD HOLDERNAME',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 21,
                            child: Text(
                              cards[index].user,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 45,
                            child: Text(
                              'EXPIRY DATE',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 21,
                            child: Text(
                              cards[index].cardExpired,
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor),
                            ),
                          )
                        ], //<Widget>
                      ),
                    );
                  },
                ),
              ),

              // Operation Section
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

               // Transaction Section
            Padding(
            padding:
            EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
            child: Text(
            'Transaction Histories',
            style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: kBlackColor),
            ),
            ),

              ListView.builder(
                itemCount: transactions.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 76,
                    margin: EdgeInsets.only(bottom: 13),
                    padding:
                    EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: kTenBlackColor,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(8.0, 8.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 57,
                              width: 57,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(transactions[index].photo),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  transactions[index].name,
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: kBlackColor),
                                ),
                                Text(
                                  transactions[index].date,
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: kGreyColor),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(transactions[index].amount, style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: kBlueColor
                            ),)
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),





            ],
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
  _DashboardState context;

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

