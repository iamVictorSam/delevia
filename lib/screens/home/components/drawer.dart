import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/add_card/add_card.dart';
import 'package:delevia_app/screens/history/history.dart';
import 'package:delevia_app/screens/my_wallet/wallet.dart';
import 'package:delevia_app/screens/profile/profile.dart';
import 'package:delevia_app/screens/promotion/promotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget createDrawer(BuildContext context) {
  Color color = Color(0xFFD5C6E6);
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        height: getScreenHeight(40),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 30),
        color: kPrimaryColor,
        child: Column(children: [
          SizedBox(
            height: getScreenHeight(12),
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xfffafafa),
            child: SvgPicture.asset('assets/icon/user-line.svg', height: 35),
          ),
          SizedBox(
            height: getScreenHeight(2.5),
          ),
          Text(
            'Irene Delevia',
            style: TextStyle(
              fontSize: getScreenHeight(2.8),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getScreenHeight(1),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ProfileScreen());
            },
            child: Text(
              'Edit profile',
              style: TextStyle(
                fontSize: getScreenHeight(2),
                color: color,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
      // Center(
      //   child: UserAccountsDrawerHeader(
      //     accountName: Text("Irene Delevia"),
      //     accountEmail: Text("Edit profile"),
      //     currentAccountPicture: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       child: SvgPicture.asset('assets/icon/user-line.svg'),
      //     ),
      //   ),
      // ),
      // Container(
      //   color: Theme.of(context).canvasColor,
      //   child: DrawerHeader(
      //     child: Text(
      //       'Navigation Drawer',
      //       style: TextStyle(
      //         fontSize: getScreenHeight(2.8),
      //       ),
      //     ),
      //   ),
      // ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(6.0)),
        child: Column(
          children: [
            ListTile(
                leading: SvgPicture.asset('assets/icon/bank-card-line.svg'),
                title: Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(AddCard());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/wallet-line.svg'),
                title: Text(
                  'My Wallet',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(WalletScreen());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/price-tag-3-line.svg'),
                title: Text(
                  'Promotions',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(PromotionScreen());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/history-line.svg'),
                title: Text(
                  'Ride history',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  Get.to(HistoryScreen());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/car-line.svg'),
                title: Text(
                  'Own a car',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  // Get.to(Promotions());
                }),
            ListTile(
                leading: SvgPicture.asset('assets/icon/information-line.svg'),
                title: Text(
                  'Support',
                  style: TextStyle(
                    fontSize: getScreenHeight(2.8),
                  ),
                ),
                onTap: () {
                  // Get.to(Promotions());
                }),
            SizedBox(
              height: getScreenHeight(2.8),
            ),
            DefaultButton(
              press: () {},
              text: 'Sign up to drive',
            ),
          ],
        ),
      ),
    ],
  ));
}
