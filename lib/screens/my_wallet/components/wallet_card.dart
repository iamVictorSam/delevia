import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/my_wallet/components/fund_wallet_btn.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      height: getScreenHeight(24),
      // width: getScreenWidth(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10), // boxShadow: [
        boxShadow: [
          BoxShadow(
            color: Color(0xFFA4A4A8),
            offset: Offset(1.0, 5.0),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getScreenHeight(3.5),
            ),
            Text(
              'Wallet Balance',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: getScreenHeight(1.5),
            ),
            Row(
              children: [
                Text(
                  '\$ 5,200.00',
                  style: TextStyle(
                    fontSize: getScreenHeight(4.8),
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove_red_eye,
                      color: Colors.white, size: getScreenHeight(2.5)),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: getScreenHeight(1),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getScreenWidth(40),
              ),
              child: FundWalletBtn(
                text: 'Fund wallet',
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
