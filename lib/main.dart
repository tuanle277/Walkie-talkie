import 'package:flutter/material.dart';
import 'package:walk/main_page.dart';
import 'package:walk/model/request.dart';
import 'package:walk/sign_in_screen.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walk with me',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Request> _dummyListOfRequest = [
    Request("Common drive"),
    Request("DePauw"),
    Request("Purdue"),
    Request("Lafayette"),
    Request("Columbia"),
    Request("Common drive"),
    Request("DePauw"),
    Request("Purdue"),
    Request("Lafayette"),
    Request("Columbia"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walk with me',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const HomePage(),
      routes: {
        '/signinpage': (context) => SignInScreen(),
        '/mainpage': ((context) => MainPage(
              _dummyListOfRequest,
            ))
      },
    );
  }
}
