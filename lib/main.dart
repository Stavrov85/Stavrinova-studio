import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';
import 'package:untitled2/main_screen.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.blueAccent
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home()
  },
  //home: Start(),

));