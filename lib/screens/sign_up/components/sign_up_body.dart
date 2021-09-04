import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/phone/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(7.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getScreenHeight(14.5),
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: getScreenHeight(5.5),
                ),
              ),
              SizedBox(
                height: getScreenHeight(5.7),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Jane Doe',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset("assets/icon/flag.svg"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getScreenHeight(5),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // TODO: work on this
                      // onSaved: (newValue) => email = newValue,
                      // onChanged: (value) {
                      //   if (value.isNotEmpty) {
                      //     removeError(error: kEmailNullError);
                      //   } else if (emailValidatorRegExp.hasMatch(value)) {
                      //     removeError(error: kInvalidEmailError);
                      //   }
                      //   return null;
                      // },
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     addError(error: kEmailNullError);
                      //     return "";
                      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
                      //     addError(error: kInvalidEmailError);
                      //     return "";
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'autupsyofjanedoe@gmail.com',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/icon/mail-line.svg",
                          ),
                        ),
                        // Icon(Icons.mail_outlined, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getScreenHeight(4),
              ),
              DefaultButton(
                text: 'Sign up',
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                  Get.to(PhoneScreen());
                },
              ),
              SizedBox(
                height: getScreenHeight(4),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HorizontalLine(),
                    Text('  OR SIGN UP WITH  ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                    HorizontalLine(),
                  ],
                ),
              ),
              SizedBox(
                height: getScreenHeight(4),
              ),
              SignUpWith(),
              SizedBox(
                height: getScreenHeight(4),
              ),
              RichText(
                text: TextSpan(
                  text: 'By clicking sign up I agree with ',
                  style: TextStyle(
                    fontSize: getScreenHeight(2),
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Terms of service and Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getScreenHeight(2),
                          decoration: TextDecoration.underline,
                          color: kPrimaryColor,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpWith extends StatelessWidget {
  const SignUpWith({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffdbdbdb),
                    blurRadius: 7,
                    offset: Offset(0, 0.1),
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: SvgPicture.asset('assets/icon/google icon.svg')),
          SizedBox(
            width: getScreenWidth(4),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffdbdbdb),
                    blurRadius: 7,
                    offset: Offset(0, 0.1),
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: SvgPicture.asset('assets/icon/facebook.svg')),
        ]);
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: kGrey),
        height: getScreenHeight(0.3),
        // width: getScreenWidth(10),
      ),
    );
  }
}
