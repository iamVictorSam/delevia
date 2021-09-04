import 'package:delevia_app/SizeConfig.dart';
import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/profile/components/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        // leadingWidth: 10,

        // title: Text('Add card'),
        actions: [
          Text('Log out',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: getScreenHeight(3),
                  fontWeight: FontWeight.bold))
        ],
      ),
      body: ProfileBody(),
    );
  }
}
