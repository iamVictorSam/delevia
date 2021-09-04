import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildTextField(
  BuildContext context,
  Function pressed, {
  TextEditingController locationController,
  TextEditingController destinationController,
  Function sendRequest,
}) {
  return Container(
      height: getScreenHeight(26.4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF3F3F5),
            offset: Offset(1.0, 5.0),
            blurRadius: 7,
            spreadRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: getScreenWidth(2.5)),
                child: IconButton(
                  icon: Icon(Icons.close, size: getScreenHeight(5)),
                  onPressed: pressed,
                ),
              ),
              SizedBox(
                width: getScreenWidth(13),
              ),
              Text(
                'Enter destination',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenHeight(3),
                ),
              ),
            ],
          ),
          TextField(
            controller: locationController,
            autofocus: true,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'pick up',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15,
                top: 16,
              ),
              icon: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15),
                child: SvgPicture.asset(
                  'assets/icon/ic location.svg',
                  height: 25,
                  width: 30,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getScreenWidth(15),
              right: getScreenWidth(4),
            ),
            child: Divider(),
          ),
          TextField(
            controller: destinationController,
            cursorColor: kPrimaryColor,
            textInputAction: TextInputAction.go,
            onSubmitted: sendRequest,
            decoration: InputDecoration(
              hintText: 'destination?',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 15,
                top: 16,
              ),
              icon: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  top: 5,
                ),
                width: getScreenWidth(1.3),
                height: getScreenHeight(
                  getScreenHeight(0.9),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 15),
                  child: SvgPicture.asset(
                    'assets/icon/map-pin-fill.svg',
                    color: Colors.red,
                    height: 25,
                    width: 30,
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
}
