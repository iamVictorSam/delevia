import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key key}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenHeight(3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appBar(
                  trailing: 'Log Out',
                  press: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: getScreenHeight(2),
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.grey[400],
                  child: SvgPicture.asset('assets/icon/user-line.svg',
                      height: 30, width: 40),
                ),
                SizedBox(height: getScreenHeight(2)),
                Text(
                  'Sam Flash',
                  style: TextStyle(
                    fontSize: getScreenHeight(3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getScreenHeight(3),
                ),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                  ignoreBlank: true,
                  autoValidateMode: AutovalidateMode.always,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: true,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                SizedBox(
                  height: getScreenHeight(3.5),
                ),
                profilFormField(),
                SizedBox(
                  height: getScreenHeight(1),
                ),
                Text('Trip receipts will be sent to your email'),
                homeWork(),
                // SizedBox(
                //   height: getScreenHeight(4),
                // ),
                Divider(),
                ListTile(
                  title: Text(
                    'Notification',
                    style: TextStyle(
                      fontSize: getScreenHeight(3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text('For receiving driver message'),
                  trailing: CupertinoSwitch(
                      activeColor: kPrimaryColor,
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                        });
                      }),
                ),
                SizedBox(
                  height: getScreenHeight(1),
                ),

                ProfileDefaultButton(
                  text: 'Connect to facebook',
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class appBar extends StatelessWidget {
  appBar({
    Key key,
    this.icon = const Icon(Icons.arrow_back_ios),
    this.title = '',
    this.trailing = '',
    this.press,
  }) : super(key: key);
  final Function press;
  final Widget icon;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
        height: getScreenHeight(5.5),
        width: getScreenWidth(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), // boxShadow: [
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              offset: Offset(1.0, 5.0),
              blurRadius: 7,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(2)),
          child: IconButton(
            icon: icon,
            onPressed: press,
          ),
        ),
      ),
      trailing: Text(trailing,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: getScreenHeight(3),
              fontWeight: FontWeight.bold)),
    );
  }
}

class ProfileDefaultButton extends StatelessWidget {
  const ProfileDefaultButton({
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: press,
        child: Row(children: [
          SizedBox(width: 10),
          SvgPicture.asset('assets/icon/facebook.svg', height: 40),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: getScreenHeight(3),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ]),
        color: kPrimaryColor,
        textColor: Colors.white,
      ),
    );
  }
}

Widget profilFormField() {
  return Form(
    child: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
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
            // labelText: 'Full Name',
            hintText: 'Full Name',

            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/icon/edit-line.svg",
                color: Colors.grey[800],
              ),
            ),
            // Icon(Icons.mail_outlined, color: Colors.black),
          ),
        ),
        SizedBox(
          height: getScreenHeight(2.5),
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
            // labelText: 'Email',
            hintText: 'Email',

            // suffixIcon: Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: SvgPicture.asset(
            //     "assets/icon/edit-line.svg",
            //   ),
            // ),
            // Icon(Icons.mail_outlined, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

Widget homeWork() {
  return Column(
    children: [
      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.home_outlined, color: Colors.grey[400]),
          radius: 15,
          backgroundColor: blueGrey,
        ),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        trailing: SvgPicture.asset(
          'assets/icon/edit-line.svg',
          // color: Colors.red,
          height: 25,
          width: 30,
          // fit: BoxFit.fill,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: getScreenWidth(16.5)),
        child: Divider(),
      ),
      ListTile(
        leading: CircleAvatar(
          child: SvgPicture.asset(
            'assets/icon/briefcase.svg',
            color: Colors.grey[400],
            height: 15,
            // width: 30,
            // fit: BoxFit.fill,
          ),
          radius: 15,
          backgroundColor: blueGrey,
        ),
        title: Text(
          'Work',
          style: TextStyle(color: Colors.black),
        ),
        trailing: SvgPicture.asset(
          'assets/icon/edit-line.svg',
          // color: Colors.red,
          height: 25,
          width: 30,
          // fit: BoxFit.fill,
        ),
      ),
    ],
  );
}
