import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/history/components/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RideDetailsBody extends StatefulWidget {
  const RideDetailsBody({Key key}) : super(key: key);

  @override
  _RideDetailsBodyState createState() => _RideDetailsBodyState();
}

class _RideDetailsBodyState extends State<RideDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset('assets/icon/route.svg'),
            ),
            SizedBox(height: 15),
            HistoryCard(),
            SizedBox(height: 15),
            Text(
              'Driver',
              style: TextStyle(
                // color: kPrimaryColor,
                fontSize: getScreenHeight(3),
                fontWeight: FontWeight.w600,
              ),
            ),
            DriversHistoryCard(),
            SizedBox(height: 15),
            Text(
              'Payment',
              style: TextStyle(
                // color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: getScreenHeight(3),
              ),
            ),
            Divider(
              color: kGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icon/cash.svg'),
                    SizedBox(
                      width: 3,
                    ),
                    Text('Cash',
                        style: TextStyle(
                          fontSize: getScreenHeight(2.5),
                        )),
                  ],
                ),
                Text(
                  '₦2400',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: getScreenHeight(2.5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget shadowContainer({@required Widget yourWidget}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), // boxShadow: [
      boxShadow: [
        BoxShadow(
          color: Color(0xFFF0F0F0),
          offset: Offset(1.0, 5.0),
          blurRadius: 7,
          spreadRadius: 2,
        ),
      ],
    ),
    child: yourWidget,
  );
}

class DriversHistoryCard extends StatelessWidget {
  const DriversHistoryCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shadowContainer(
      yourWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Column(
              children: [
                // todo: add image
                CircleAvatar(radius: 30),
                SizedBox(
                  height: 7,
                ),
                ratingContainer(rating: '4.5'),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  'Benjamin Stain',
                  style: TextStyle(
                    // color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: getScreenHeight(3),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Red',
                      style: TextStyle(
                        // color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: getScreenHeight(2.5),
                      ),
                    ),
                    SizedBox(width: getScreenWidth(1)),
                    roundDot(),
                    SizedBox(width: getScreenWidth(1)),
                    Text(
                      'Honda',
                      style: TextStyle(
                        // color: kPrimaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: getScreenHeight(2.5),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget ratingContainer({@required String rating}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.indigo[100],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        children: [
          SvgPicture.asset('assets/icon/star-fill.svg', height: 12),
          SizedBox(
            width: getScreenWidth(1),
          ),
          Text(
            rating,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget roundDot() {
  return Container(
    height: 6,
    width: 6,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: kPrimaryColor,
    ),
  );
}
