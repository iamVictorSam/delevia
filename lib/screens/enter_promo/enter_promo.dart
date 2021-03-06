import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/enter_promo/components/enter_promo_body.dart';
import 'package:flutter/material.dart';

class EnterPromo extends StatelessWidget {
  const EnterPromo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('History'),
      ),
      body: EnterPromoBody(),
    );
  }
}
