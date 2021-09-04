import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      // height: getScreenHeight(38),
      // width: getScreenWidth(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // boxShadow: [
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF0F0F0),
            offset: Offset(1.0, 5.0),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(4), vertical: getScreenHeight(3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '8 JUNE 2021, 18:39',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: getScreenWidth(28)),
                Text(
                  'FINISHED',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: getScreenHeight(2.5)),
              ],
            ),
            Divider(),
            SizedBox(height: getScreenHeight(1)),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '11:24',
                      style: TextStyle(
                        fontSize: getScreenHeight(2.2),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA4A4A8),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(8)),
                    Text(
                      '11:38',
                      style: TextStyle(
                        fontSize: getScreenHeight(2.2),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA4A4A8),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: getScreenHeight(0.7),
                    ),
                    Icon(
                      Icons.circle,
                      size: getScreenHeight(1.6),
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      height: getScreenHeight(0.7),
                    ),
                    Container(
                      height: getScreenHeight(7),
                      width: getScreenWidth(0.3),
                      color: Colors.black,
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.red),
                  ],
                ),
                SizedBox(
                  width: getScreenWidth(2),
                ),
                Column(
                  children: [
                    SizedBox(height: getScreenHeight(2)),
                    Text(
                      '1, Happy Rolling Street, Alakahia \nPorthacourt',
                      style: TextStyle(
                        fontSize: getScreenHeight(2.2),
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                    SizedBox(height: getScreenHeight(6)),
                    Text(
                      '1, Happy Rolling Street, Alakahia \nPorthacourt',
                      style: TextStyle(
                        fontSize: getScreenHeight(2.2),
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
