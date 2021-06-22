// //import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:slide_page_app/size_config.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//  @override
//  void initState() {
//    SystemChrome.setEnabledSystemUIOverlays([]);
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    SizeConfig().init(context);
//    return Scaffold(
//      backgroundColor: Colors.black,
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        leading: Icon(
//          Icons.arrow_back,
//          color: Colors.white,
//          size: SizeConfig.defaultHeight * 4,
//        ),
//      ),
//      body: Column(
//        children: [_buildHeader()],
//      ),
//    );
//  }
// }
//
// _buildHeader() => Padding(
//      padding: EdgeInsets.symmetric(
//          horizontal: SizeConfig.defaultWidth * 2,
//          vertical: SizeConfig.defaultHeight * 2),
//      child: Row(
//        children: [
//          Text(
//            'My Card',
//            style: TextStyle(
//              fontSize: 20,
//              fontWeight: FontWeight.bold,
//              color: Colors.black,
//            ),
//          ),
//        ],
//      ),
//    );
