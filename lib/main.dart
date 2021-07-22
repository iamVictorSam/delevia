import 'package:delevia_app/intro.dart';
import 'package:flutter/material.dart';
import 'package:delevia_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delevia',
      theme: theme(),
      home: InitScreen(),
    );
  }
}
