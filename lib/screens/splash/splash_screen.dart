import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/reg_selection/reg_selection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// List<MyClass> selecteditems = List();
class _SplashScreenState extends State<SplashScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegSelection()),
                      (route) => false),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getScreenHeight(10)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   stops: [0.1, 0.4, 0.7, 0.9],
                  //   colors: [
                  //     Color(0xFFFAF7FC),
                  //     Color(0xFFEBEBEB),
                  //     Color(0xFFC9C8CA),
                  //     Color(0xFFD8D6DA),
                  //   ],
                  // ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: getScreenHeight(60.0),
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          page1(),
                          page2(),
                          page3(),
                        ],
                      ),
                    ),
                    SizedBox(height: getScreenHeight(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    SizedBox(height: getScreenHeight(2)),
                    _currentPage != _numPages - 1
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: getScreenWidth(5.0),
                              right: getScreenWidth(5),
                              // top: getScreenHeight(2)
                            ),
                            child: DefaultButton(
                                press: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                text: 'Next'),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: getScreenHeight(12),
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RegSelection()),
                      (route) => false);
                },
                // Navigator.pushAndRemoveUntil(
                //   context,
                // MaterialPageRoute(builder: (context) => RegSelection()),
                // ),

                // Get.off(RegSelection(), transition: Transition.cupertino),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 6.0,
      width: isActive ? 20.0 : 14.0,
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : Color(0xFF9595B7),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

Widget page1() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logos/sitting_dude.png',
          height: getScreenHeight(25),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          child: Text(
            'Request a Ride',
            style: TextStyle(
                fontSize: getScreenHeight(3.5),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
        SizedBox(
          height: getScreenHeight(2.5),
        ),
        Container(
          child: Text(
            'Request a ride picked up by a \n nearbly community driver',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
        // Container(decoration: BoxDecoration)
      ]);
}

Widget page2() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          'assets/logos/map.png',
          height: getScreenHeight(25),
        )),
        SizedBox(
          height: 40,
        ),
        Container(
          child: Text(
            'Set your location',
            style: TextStyle(
                fontSize: getScreenHeight(3.5),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
        SizedBox(
          height: getScreenHeight(2.5),
        ),
        Container(
          child: Text(
            'Enable location sharing so that your \n nearbly driver can see where you are',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
        // Container(decoration: BoxDecoration)
      ]);
}

Widget page3() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          'assets/logos/woman_car.png',
          height: getScreenHeight(25),
        )),
        SizedBox(
          height: getScreenHeight(2.7),
        ),
        Container(
          child: Text(
            'Confirm Your Driver',
            style: TextStyle(
                fontSize: getScreenHeight(3.5),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
        SizedBox(
          height: getScreenHeight(2.5),
        ),
        Container(
          child: Text(
            'Huge drivers network helps you find\n comfortable, safe and cheap ride ',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
        // Container(decoration: BoxDecoration)
      ]);
}