import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget searchModal(
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: getScreenHeight(77),
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
            // SizedBox(height: getScreenHeight(2)),
            // Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(10),
            //         ),
            //         color: kGrey2),
            //     height: getScreenHeight(7),
            //     width: double.infinity,
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding:
            //               EdgeInsets.symmetric(horizontal: getScreenWidth(4)),
            //           child: Icon(Icons.search),
            //         ),
            //         // SizedBox(width: getScreenWidth(4)),
            //         Text('Where are you going?',
            //             style: TextStyle(color: Color(0xff929292))),
            //       ],
            //     )),
            SizedBox(height: getScreenHeight(5)),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home_outlined, color: Colors.grey[400]),
                radius: 15,
                backgroundColor: blueGrey,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
              trailing: SvgPicture.asset(
                'assets/icon/edit-line.svg',
                // color: Colors.red,
                height: 25,
                width: 30,
                // fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getScreenWidth(16.5)),
              child: Divider(),
            ),
            ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset(
                  'assets/icon/briefcase.svg',
                  color: Colors.grey[400],
                  height: 15,
                  // width: 30,
                  // fit: BoxFit.fill,
                ),
                radius: 15,
                backgroundColor: blueGrey,
              ),
              title: Text(
                'Work',
                style: TextStyle(color: Colors.black),
              ),
              trailing: SvgPicture.asset(
                'assets/icon/edit-line.svg',
                // color: Colors.red,
                height: 25,
                width: 30,
                // fit: BoxFit.fill,
              ),
            ),
            Divider(),
            ListTile(
              leading: SvgPicture.asset('assets/icon/map-pin-line.svg'),
              title: Text('University of PortHarcourt'),
              subtitle: Text('Rivers State',
                  style: TextStyle(
                    color: blueGrey,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: getScreenWidth(16.5)),
              child: Divider(),
            ),
            ListTile(
              leading: SvgPicture.asset('assets/icon/map-pin-line.svg'),
              title: Text('Boys Lodge, Alakahia'),
              subtitle: Text('Rivers State',
                  style: TextStyle(
                    color: blueGrey,
                  )),
            ),
          ],
        ),
      ),
    ),
  );
}
