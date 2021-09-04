import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appbar.dart';
import 'package:delevia_app/screens/my_wallet/components/wallet_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(5.55)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // appBar(
                //     press: () => Navigator.pop(context),
                //     title: 'Wallet',
                //     icon: Icon(Icons.arrow_back_ios)),
                SizedBox(height: getScreenHeight(10)),
                WalletCard(),
                // Expanded(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
