import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("OTP Verification"),
      // ),
      body: Body(),
    );
  }
}
