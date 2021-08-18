import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/drawerConfig.dart';
import 'package:delevia_app/screens/history/history.dart';
import 'package:delevia_app/screens/my_wallet/components/fund_wallet_btn.dart';
import 'package:delevia_app/screens/my_wallet/wallet.dart';
import 'package:delevia_app/screens/profile/profile.dart';
import 'package:delevia_app/screens/promotion/promotion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Color color = Color(0xFFD5C6E6);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        padding: EdgeInsets.only(top: 50, bottom: 70, left: 15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 30,
                ),
                SizedBox(width: getScreenWidth(3)),
                Column(children: [
                  Text('Irene Delevia',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getScreenHeight(2.9),
                          fontWeight: FontWeight.bold)),
                  Text('Edit Profile',
                      style: TextStyle(
                          color: Color(0xFFD7BFF0),
                          fontSize: getScreenHeight(2.3),
                          fontWeight: FontWeight.w600)),
                ]),
              ]),
              Column(
                children: [
                  drawerNav(
                    icon: Icon(
                      Icons.credit_card_outlined,
                      color: color,
                    ),
                    text: 'Payment',
                    press: () {},
                  ),
                  drawerNav(
                    icon: Icon(
                      Icons.wallet_travel_outlined,
                      color: color,
                    ),
                    text: 'My wallet',
                    press: () {
                      Get.to(WalletScreen());
                    },
                  ),
                  drawerNav(
                    icon: Icon(
                      Icons.tag_faces_outlined,
                      color: color,
                    ),
                    text: 'Promotions',
                    press: () => Get.to(
                      PromotionScreen(),
                    ),
                  ),
                  drawerNav(
                    icon: Icon(
                      Icons.reply_outlined,
                      color: color,
                    ),
                    text: 'Ride History',
                    press: () => Get.to(HistoryScreen()),
                  ),
                  drawerNav(
                    icon: Icon(
                      Icons.local_taxi,
                      color: color,
                    ),
                    text: 'Own a car',
                    press: () {},
                  ),
                  drawerNav(
                    icon: Icon(
                      Icons.info_outline,
                      color: color,
                    ),
                    text: 'Support',
                    press: () {},
                  ),
                ],
              ),
// SizedBox(height: gt)
              Padding(
                padding: EdgeInsets.only(right: getScreenWidth(3)),
                child: FundWalletBtn(text: 'Sign up to drive', press: () {}),
              ),
              // Row(
              //   children: [
              //     Icon(Icons.settings, color: Colors.white),
              //     SizedBox(width: 10),
              //     Text('Settings',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold)),
              //     SizedBox(width: 10),
              //     Container(height: 20, width: 2, color: Color(0xFFD7BFF0)),
              //     SizedBox(width: 10),
              //     Text('Log out',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold)),
              //   ],
              // )
            ]));
  }
}

Widget drawerNav({Function press, Widget icon, String text}) {
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
                  color: Color(0xFFD5C6E6),
                  fontSize: getScreenHeight(3),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
}
