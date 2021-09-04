import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appbar.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/share_code/components/promo_code_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShareCodeBody extends StatefulWidget {
  const ShareCodeBody({Key key}) : super(key: key);

  @override
  _ShareCodeBodyState createState() => _ShareCodeBodyState();
}

class _ShareCodeBodyState extends State<ShareCodeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(5.6),
          ),
          child: Column(
            children: [
              // appBar(
              //   press: () => Get.back(closeOverlays: true),
              //   icon: Icon(Icons.arrow_back_ios),
              // ),
              SizedBox(height: getScreenHeight(5)),
              SvgPicture.asset('assets/vector/ride with friends.svg'),
              SizedBox(height: getScreenHeight(5)),
              earnMoney(),
              SizedBox(height: getScreenHeight(2)),
              earnMoneyWriteUp(),
              SizedBox(height: getScreenHeight(19.7)),
              PromoCode(),
              SizedBox(height: getScreenHeight(1)),
              DefaultButton(press: () {}, text: 'Share code')
            ],
          ),
        ),
      ),
    );
  }

  Text earnMoneyWriteUp() {
    return Text(
      'Invite a friend and earn Money',
      style: TextStyle(
        color: Colors.grey[500],
      ),
    );
  }

  Text earnMoney() {
    return Text(
      'Earn Money',
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: getScreenHeight(3.5),
      ),
    );
  }
}
