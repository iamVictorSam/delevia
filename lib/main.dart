import 'package:delevia_app/intro.dart';
import 'package:flutter/material.dart';
import 'package:delevia_app/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delevia',
      theme: theme(),
      home: InitScreen(),
    );
  }
}
