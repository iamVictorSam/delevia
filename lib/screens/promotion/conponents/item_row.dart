import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';

Widget itemRow({Function press, Widget icon, String text}) {
  return GestureDetector(
    onTap: press,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: getScreenHeight(2.5)),
      child: Row(
        children: [
          icon,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(2)),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getScreenHeight(3),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
