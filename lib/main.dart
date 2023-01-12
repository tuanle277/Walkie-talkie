import 'package:flutter/material.dart';
import 'package:walk/main_page.dart';
import 'package:walk/model/house_request.dart';
import 'package:walk/model/normal_request.dart';
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
      theme: ThemeData(fontFamily: "Montserrat"),
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
  final List _dummyListOfRequest = [
    HouseRequest("925 Hilltop dr", 'house', '2.1km'),
    NormalRequest("Buffalo Wild Wings", "32 jump street", "restaurant", "3km"),
    HouseRequest("Common drive", 'house', '2.1km'),
    HouseRequest("Common drive", 'house', '2.1km'),
    HouseRequest("Common drive", 'house', '2.1km'),
    HouseRequest("Common drive", 'house', '2.1km'),
    NormalRequest(
        "Fluttering Duck",
        "32 jump street (such as a letter or package) an envelope with an illegible address.",
        "restaurant",
        "3km"),
    HouseRequest("Common drive", 'house', '2.1km'),
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
            )),
      },
    );
  }
}
