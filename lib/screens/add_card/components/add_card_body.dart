import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/default_button.dart';
import 'package:delevia_app/constants.dart';
import 'package:delevia_app/screens/add_card/components/card_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCardBody extends StatefulWidget {
  const AddCardBody({Key key}) : super(key: key);

  @override
  _AddCardBodyState createState() => _AddCardBodyState();
}

class _AddCardBodyState extends State<AddCardBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: getScreenHeight(2),
                ),
                CardForm(),
                SizedBox(
                  height: getScreenHeight(50),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'Delevia may charge small amount to confirm card details. ',
                    style: TextStyle(
                      fontSize: getScreenHeight(2),
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'Lean more',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getScreenHeight(2),
                            decoration: TextDecoration.underline,
                            color: kPrimaryColor,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultButton(
                  text: 'Add card',
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
