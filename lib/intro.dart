import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:delevia_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens/home/home_screen.dart';
import 'screens/splash/splash_screen.dart';

class InitScreen extends StatefulWidget {
  static String routeName = '/initScreen';
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SizedBox(
          child: Column(
            children: [
              Expanded(
                // flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: SvgPicture.asset('assets/icon/logo.svg',
                      width: double.infinity, height: double.infinity),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 250.0),
              //   child: CircularProgressIndicator(),
              // )
            ],
          ),
        ),
        splashIconSize: 280.0,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        nextScreen: SplashScreen());
  }
}
