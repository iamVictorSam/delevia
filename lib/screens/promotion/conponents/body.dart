import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appbar.dart';
import 'package:delevia_app/screens/promotion/conponents/discount_card.dart';
import 'package:delevia_app/screens/promotion/conponents/item_row.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(5.6), /*vertical: getScreenHeight(4.9)*/),
          child: Column(
            children: [
              appBar(
                  icon: Icon(Icons.arrow_back_ios),
                  press: () => Get.back(),
                  title: 'Promotions'),
              SizedBox(
                height: getScreenHeight(5),
              ),
              itemRow(
                icon: Icon(Icons.card_giftcard_outlined),
                text: 'Invite Friends',
                press: () {},
              ),
              itemRow(
                icon: Icon(Icons.card_giftcard_outlined),
                text: 'Enter Code',
                press: () {},
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
