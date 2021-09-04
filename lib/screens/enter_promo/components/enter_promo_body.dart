import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/profile/components/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPromoBody extends StatefulWidget {
  const EnterPromoBody({Key key}) : super(key: key);

  @override
  _EnterPromoBodyState createState() => _EnterPromoBodyState();
}

class _EnterPromoBodyState extends State<EnterPromoBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // appBar(
          //     icon: Icon(Icons.arrow_back_ios),
          //     press: () => Get.back(),
          //     title: 'Promotions'),
          SizedBox(
            height: getScreenHeight(4),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(22)),
            child: Column(children: [
              TextField(
                style: TextStyle(
                  fontSize: getScreenHeight(3.5),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: getScreenHeight(3),
              ),
              Text(
                'Enter the code and it will be applied to your next trip',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: getScreenHeight(3),
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
          ),
          SizedBox(height: getScreenHeight(58)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: DefaultButton(text: 'Submit', press: () {}),
          ),
        ],
      ),
    );
  }
}
