import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/promotion/conponents/body.dart';
import 'package:flutter/material.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('Promotions'),
      ),
      body: Body(),
    );
  }
}
