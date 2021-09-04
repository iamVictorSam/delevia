import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodBody extends StatefulWidget {
  const PaymentMethodBody({Key key}) : super(key: key);

  @override
  _PaymentMethodBodyState createState() => _PaymentMethodBodyState();
}

class _PaymentMethodBodyState extends State<PaymentMethodBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Payment methods'),
          ListTile(
            leading: SvgPicture.asset('assets/icon/cash.svg'),
            title: Text('Cash'),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icon/add-line.svg'),
            title: Text('Add card'),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icon/wallet-line.svg'),
            title: Text('Wallet'),
          ),
        ],
      ),
    );
  }
}
