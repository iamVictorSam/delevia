import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/material.dart';

Widget discountCard() {
  return Container(
    // alignment: Alignment.center,
    height: getScreenHeight(14.5),
    width: double.infinity,
    decoration: BoxDecoration(
      color: kPrimaryColor,
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
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(8),
        vertical: getScreenHeight(4),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '30% discount',
              style: TextStyle(
                fontSize: getScreenHeight(3.5),
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: getScreenHeight(0.8),
            ),
            Text(
              'applied to your next 10 rides',
              style: TextStyle(
                  color: Colors.white,
                  /*fontSize: getScreenHeight(3),*/ fontWeight:
                      FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
