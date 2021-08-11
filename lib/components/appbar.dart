import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';

class appBar extends StatelessWidget {
  appBar({
    Key key,
    this.icon,
    this.title = '',
    this.press,
  }) : super(key: key);
  final Function press;
  final Widget icon;
  final String title;

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
                  color: Color(0xFFA4A4A8),
                  offset: Offset(1.0, 5.0),
                  blurRadius: 7,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(2)),
              child: IconButton(
                icon: icon,
                onPressed: press,
              ),
            ),
          ),
          SizedBox(width: getScreenWidth(25)),
          Padding(
            padding: EdgeInsets.only(top: 13.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: getScreenHeight(3),
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
