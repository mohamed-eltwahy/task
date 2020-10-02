import 'package:flutter/material.dart';
import 'package:task/screens/home.dart';
import 'package:task/screens/thirdpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: 
      Home(),
       routes: {
         ThirdPage.id: (context) => ThirdPage(),
       },
       //ThirdPage(),
    );
  }
}
