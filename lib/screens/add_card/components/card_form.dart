import 'package:delevia_app/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardForm extends StatelessWidget {
  const CardForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: getScreenHeight(8.3),
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
              hintText: 'Card Number',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  "assets/icon/bank-card-line.svg",
                  color: Colors.grey[800],
                  height: 10,
                  width: 20,
                ),
              ),
              // Icon(Icons.mail_outlined, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
                    hintText: 'Expiry Date',
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: SvgPicture.asset(
                    //     "assets/icon/bank-card-line.svg",
                    //   ),
                    // ),
                    // Icon(Icons.mail_outlined, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
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
                    hintText: 'CVC',
                    // prefixIcon: Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: SvgPicture.asset(
                    //     "assets/icon/bank-card-line.svg",
                    //   ),
                    // ),
                    // // Icon(Icons.mail_outlined, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
