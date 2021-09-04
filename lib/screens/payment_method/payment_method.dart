import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/payment_method/components/payment_method_body.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('Payment'),
      ),
      body: PaymentMethodBody(),
    );
  }
}
