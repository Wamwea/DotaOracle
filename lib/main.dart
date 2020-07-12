import 'package:flutter/material.dart';
import 'package:mydotastats/screens/DataScreen.dart';
import 'package:mydotastats/screens/LoadingScreen.dart';
import 'package:mydotastats/screens/MatchScreen.dart';
import 'package:mydotastats/screens/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Dota Stats',
        theme: ThemeData(
            primarySwatch: Colors.blue, primaryColorDark: Colors.black),
        home: WelcomeScreen());
  }
}
