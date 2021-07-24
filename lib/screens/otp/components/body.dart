import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(7)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.17),
              Text(
                "Verify phone number",
                style: headingStyle,
              ),
              SizedBox(height: getScreenHeight(3)),
              Text("Enter the CODE sent to +2348089633542"),
              SizedBox(height: getScreenHeight(2)),
              RichText(
                text: TextSpan(
                  text: 'Correct phone number?',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  children: [
                    TextSpan(
                      text: ' Edit',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              // Text("Correct phone number?"),
              // buildTimer(),
              OtpForm(),
              // SizedBox(height: SizeConfig.screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }

//   Row buildTimer() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("This code will expired in "),
//         TweenAnimationBuilder(
//           tween: Tween(begin: 30.0, end: 0.0),
//           duration: Duration(seconds: 30),
//           builder: (_, value, child) => Text(
//             "00:${value.toInt()}",
//             style: TextStyle(color: kPrimaryColor),
//           ),
//         ),
//       ],
//     );
//   }
}
