import 'Navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Craft Science',
        theme : ThemeData(primarySwatch: Colors.red),
        home: Navigation(),
        debugShowCheckedModeBanner: false,
    );
  }
}