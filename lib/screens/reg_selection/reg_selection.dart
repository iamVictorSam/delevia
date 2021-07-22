import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/components/default_button2.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/material.dart';

class RegSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Welcome to \n',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                      fontSize: getScreenHeight(5)),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'delevia',
                      style: TextStyle(
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFEB2326),
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getScreenHeight(7),
              ),
              DefaultButton(
                press: () {},
                text: 'Log in',
              ),
              SizedBox(
                height: getScreenHeight(2),
              ),
              DefaultButton2(press: () {}, text: 'Sign up')
            ],
          ),
        ),
      ),
    );
  }
}
