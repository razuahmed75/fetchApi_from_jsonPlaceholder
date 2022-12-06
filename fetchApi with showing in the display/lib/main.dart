// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github/homePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 48, 42, 75),
    ));
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.path,
      routes: {
        HomePage.path: (context) => HomePage(),
      },
    );
  }
}
