import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/otp/otp.dart';
import 'package:delevia_app/screens/phone/phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
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
                          prefixIcon: Icon(Icons.person, color: Colors.black),
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
                          prefixIcon:
                              Icon(Icons.mail_outlined, color: Colors.black),
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: kGrey),
                          height: getScreenHeight(0.3),
                          // width: getScreenWidth(10),
                        ),
                      ),
                      Text('  OR SIGN UP WITH  ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: blueGrey),
                          height: getScreenHeight(0.3),
                          // width: ,
                        ),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
