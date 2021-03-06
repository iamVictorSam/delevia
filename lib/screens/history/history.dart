import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/history/components/body.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('History'),
      ),
      body: Body(),
    );
  }
}
