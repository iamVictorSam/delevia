import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF2D2E6F);
Color kGrey = Color(0xFFC4C4C4);
Color kGrey2 = Color(0xFFEEEEEE);
Color blueGrey = Color(0xFFD5DDE0);
Color kSecondaryColor = Color(0xFFFEFEFE);

final headingStyle = TextStyle(
  fontSize: getScreenHeight(4),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getScreenHeight(4)),
  // border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  // enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    // borderRadius: BorderRadius.all(Radius.circular(1)),
    borderSide: BorderSide(color: kPrimaryColor),
  );
}
