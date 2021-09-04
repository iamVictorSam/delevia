import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/my_wallet/components/body.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('Wallet'),
      ),
      body: Body(),
    );
  }
}
