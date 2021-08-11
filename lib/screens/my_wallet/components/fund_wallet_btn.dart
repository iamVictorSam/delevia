import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';

class FundWalletBtn extends StatelessWidget {
  const FundWalletBtn({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getScreenHeight(7),
      child: OutlineButton(
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: getScreenHeight(2.5),
          ),
        ),
        borderSide: BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
