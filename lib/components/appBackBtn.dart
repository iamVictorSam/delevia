import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackBtn extends StatelessWidget {
  const AppBackBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.center,
      // height: getScreenHeight(1),
      width: getScreenWidth(3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // boxShadow: [
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(1.0, 5.0),
            blurRadius: 7,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}
