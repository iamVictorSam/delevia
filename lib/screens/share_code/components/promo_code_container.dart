import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenHeight(7),
      decoration: BoxDecoration(
          color: blueGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SAMFLASHBOLT080',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(width: getScreenWidth(4)),
          SvgPicture.asset('assets/icon/file-copy-line.svg'),
        ],
      ),
    );
  }
}
