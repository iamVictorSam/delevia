import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/invite_friends/components/invite_friend_body.dart';
import 'package:flutter/material.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('History'),
      ),
      body: InviteFriendsBody(),
    );
  }
}
