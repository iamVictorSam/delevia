import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/add_card/components/add_card_body.dart';
import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('Add card'),
      ),
      body: AddCardBody(),
    );
  }
}
