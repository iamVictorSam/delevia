import 'package:delevia_app/components/appBackBtn.dart';
import 'package:delevia_app/screens/ride_details/components/ride_details_body.dart';
import 'package:flutter/material.dart';

class RideDetails extends StatelessWidget {
  const RideDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackBtn(),
        title: Text('Ride History'),
      ),
      body: RideDetailsBody(),
    );
  }
}
