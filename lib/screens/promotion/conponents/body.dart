import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appbar.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/enter_promo/enter_promo.dart';
import 'package:delevia_app/screens/invite_friends/invite_friends.dart';
import 'package:delevia_app/screens/promotion/conponents/discount_card.dart';
import 'package:delevia_app/screens/promotion/conponents/item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(5.6), /*vertical: getScreenHeight(4.9)*/
          ),
          child: Column(
            children: [
              // appBar(
              //     icon: Icon(Icons.arrow_back_ios),
              //     press: () => Get.back(),
              //     title: 'Promotions'),
              SizedBox(
                height: getScreenHeight(5),
              ),
              itemRow(
                icon: SvgPicture.asset('assets/icon/gift-line.svg'),
                text: 'Invite Friends',
                press: () => Get.to(() => InviteFriends()),
              ),
              itemRow(
                icon: SvgPicture.asset('assets/icon/price-tag-3-line.svg'),
                text: 'Enter Code',
                press: () {
                  Get.to(EnterPromo());
                },
              ),
              Divider(),
              SizedBox(
                height: getScreenHeight(3),
              ),
              discountCard(),
            ],
          ),
        ),
      ),
    );
  }
}
