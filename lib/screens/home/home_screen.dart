import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/request/google_map_request.dart';
import 'package:delevia_app/screens/add_card/add_card.dart';
import 'package:delevia_app/screens/history/history.dart';
import 'package:delevia_app/screens/home/components/body.dart';
import 'package:delevia_app/screens/home/components/drawer.dart';
import 'package:delevia_app/screens/my_wallet/wallet.dart';
import 'package:delevia_app/screens/profile/profile.dart';
import 'package:delevia_app/screens/promotion/promotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locator;
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../SizeConfig.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: createDrawer(context),
      body: HomeBody(),
      // Stack(
      //   children: [
      //     DrawerScreen(),
      //     Map(),
      //   ],
      // ),
    );
  }
}


// void modalBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       context: context,
//       builder: (builder) {
//         return bottomModal(context);
//       });
// }

Widget bottomModal(BuildContext context, Function press) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    height: getScreenHeight(37),
    width: MediaQuery.of(context).size.width,
    // color: Colors.white,
    child: GestureDetector(
      onTap: () {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => RegSelection()),
        //     (route) => false);
      },
      // Navigator.pushAndRemoveUntil(
      //   context,
      // MaterialPageRoute(builder: (context) => RegSelection()),
      // ),

      // Get.off(RegSelection(), transition: Transition.cupertino),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: getScreenHeight(3)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: kGrey),
              height: getScreenHeight(0.7),
              width: getScreenWidth(10),
            ),
            SizedBox(height: getScreenHeight(2)),
            GestureDetector(
              onTap: press,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: kGrey2),
                  height: getScreenHeight(7),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
                        child: SvgPicture.asset("assets/icon/search-line.svg"),
                      ),
                      // SizedBox(width: getScreenWidth(4)),
                      Text('Where are you going?',
                          style: TextStyle(color: Color(0xff929292))),
                    ],
                  )),
            ),
            SizedBox(height: getScreenHeight(2)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: getScreenHeight(9),
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.location_on,
                        size: getScreenHeight(3.7),
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: blueGrey,
                    ),
                  ),
                  // SizedBox(width: getScreenWidth(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenHeight(1.5),
                      ),
                      Text(
                        'River State University',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'River',
                        style: TextStyle(color: blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getScreenWidth(16.5)),
              child: Divider(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: getScreenHeight(9),
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.location_on,
                        size: getScreenHeight(3.7),
                        color: Colors.white,
                      ),
                      radius: 15,
                      backgroundColor: blueGrey,
                    ),
                  ),
                  // SizedBox(width: getScreenWidth(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getScreenHeight(1.5),
                      ),
                      Text(
                        'UniPort',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Port-Harcourt Nigeria',
                        style: TextStyle(color: blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



