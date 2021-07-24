import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/otp/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight * 0.17),
                    Text(
                      "Enter your number",
                      style: headingStyle,
                    ),
                    SizedBox(height: getScreenHeight(2.5)),
                    Text('We will send a code to verify your \nPhone number',
                        style: TextStyle(
                          color: Color(0xFF424242),
                        )),
                    SizedBox(height: getScreenHeight(3)),
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
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: false,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.4),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        Get.to(OtpScreen());
                      },
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     formKey.currentState.validate();
                    //   },
                    //   child: Text('Validate'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     getPhoneNumber('+15417543010');
                    //   },
                    //   child: Text('Update'),
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     formKey.currentState.save();
                    //   },
                    //   child: Text('Save'),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
