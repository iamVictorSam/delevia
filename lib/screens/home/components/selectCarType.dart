import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCar extends StatelessWidget {
  const SelectCar(
      {Key key, this.carType, this.rideType, this.rideTime, this.price})
      : super(key: key);

  final String carType, rideType, rideTime, price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // selectedTileColor: Colors.indigo[50],
      focusColor: Colors.indigo[50],
      leading: SvgPicture.asset('assets/icon/$carType.svg'),
      title: Row(
        children: [
          Text(rideType,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
      subtitle: RichText(
        text: TextSpan(
            text: '4 seats  ',
            style: TextStyle(fontSize: 14),
            children: [
              TextSpan(
                text: '$rideTime min',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ]),
      ),
      trailing: Text(
        '₦$price',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    );
  }
}


Widget selectCar(BuildContext context, Function press) {
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
            SelectCar(
              carType: 'car on map',
              rideTime: '4',
              rideType: 'Regular',
              price: '2400',
            ),
            SelectCar(
              carType: 'car executive',
              rideTime: '3',
              rideType: 'Executive',
              price: '3400',
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset('assets/icon/wallet-line.svg'),
                backgroundColor: blueGrey,
              ),
              title: Text(
                'Payment Method',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              subtitle: Text(
                'Delevia Wallet',
                style: TextStyle(fontSize: 15),
              ),
              trailing: SvgPicture.asset('assets/icon/arrow-right-line.svg'),
            ),
            DefaultButton(
              text: 'Select Regular',
              press: () {},
            )
          ],
        ),
      ),
    ),
  );
}
