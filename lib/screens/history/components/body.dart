import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appbar.dart';
import 'package:delevia_app/screens/history/components/history_card.dart';
import 'package:delevia_app/screens/ride_details/ride_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5.6)),
            child: Column(
              children: [
                // appBar(
                //   title: 'History',
                //   press: () => Get.back(),
                //   icon: Icon(Icons.arrow_back_ios),
                // ),
                SizedBox(
                  height: getScreenHeight(6),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(RideDetails());
                    },
                    child: HistoryCard()),
                SizedBox(
                  height: getScreenHeight(2),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(RideDetails());
                    },
                    child: HistoryCard()),
                SizedBox(
                  height: getScreenHeight(2),
                ),
                // HistoryCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
