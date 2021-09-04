import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appbar.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/share_code/share_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InviteFriendsBody extends StatefulWidget {
  InviteFriendsBody({Key key}) : super(key: key);

  @override
  _InviteFriendsBodyState createState() => _InviteFriendsBodyState();
}

class _InviteFriendsBodyState extends State<InviteFriendsBody> {
  bool invite = false;

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
              //   press: () => Get.back(),
              //   icon: Icon(Icons.arrow_back_ios),
              // ),
              SizedBox(height: getScreenHeight(5)),
              SvgPicture.asset('assets/vector/ride with friends.svg'),
              SizedBox(height: getScreenHeight(5)),
              rideWithFriends(),
              SizedBox(height: getScreenHeight(1.7)),
              rideFriendWriteUp(),
              SizedBox(height: getScreenHeight(25)),
              DefaultButton(
                  press: () {
                    Get.to(
                      ShareCode(),
                      transition: Transition.fadeIn,
                    );
                  },
                  text: 'Invite a friend')
            ],
          ),
        ),
      ),
    );
  }

  Text rideFriendWriteUp() {
    return Text(
      'Move round around your city \n with Delevia and also get free rides',
      style: TextStyle(
        fontSize: getScreenHeight(2.5),
        color: Colors.grey[500],
      ),
    );
  }

  Text rideWithFriends() {
    return Text(
      'Ride with friends!',
      style: TextStyle(
        color: kPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: getScreenHeight(3.5),
      ),
    );
  }
}
