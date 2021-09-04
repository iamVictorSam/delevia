import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class appBar extends StatelessWidget {
  appBar({
    Key key,
    this.icon = const Icon(Icons.arrow_back_ios),
    this.title = '',
    this.trailing = '',
    this.press,
  }) : super(key: key);
  final Function press;
  final Widget icon;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: getScreenHeight(4.3)),
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: getScreenHeight(5.5),
            width: getScreenWidth(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10), // boxShadow: [
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: Offset(1.0, 5.0),
                  blurRadius: 7,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(2)),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: press,
              ),
            ),
          ),
          SizedBox(width: getScreenWidth(15)),
          // Padding(
          //   padding: EdgeInsets.only(top: 13.0),
          //   child: Text(
          //     title,
          //   style: TextStyle(
          //     fontSize: getScreenHeight(3),
          //     letterSpacing: 1,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // ),
          // SizedBox(width: getScreenWidth(15)),
        ],
      ),
    ]);
  }
}
