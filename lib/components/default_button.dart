import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
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
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getScreenHeight(2.5),
          ),
        ),
        color: kPrimaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
