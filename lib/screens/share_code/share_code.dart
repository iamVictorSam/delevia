import 'package:delevia_app/screens/share_code/components/share_code_body.dart';
import 'package:flutter/material.dart';

class ShareCode extends StatelessWidget {
  const ShareCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShareCodeBody(),
    );
  }
}
