import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:walk/model/request_card.dart';

import './model/request.dart';
import './model/user.dart';
import 'package:walk/sign_in_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'package:overlay_support/overlay_support.dart';

import 'package:walk/sign_in_screen.dart';
import 'package:walk/main_page.dart';
import 'home_page.dart';
import 'chat_room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: MaterialApp(
          title: 'Walk with me',
          theme: ThemeData(fontFamily: "Montserrat"),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Position position;

  void _getUserPosition() async {
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      position = userLocation;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserPosition();
  }

  final List _dummyListOfRequest = [
    Request("925 Hilltop dr", 2.1),
    Request("32 jump street", 2.1),
    Request("Common drive", 2.1),
    Request("Common drive", 2.1),
    Request("Common drive", 2.1),
    Request("Common drive", 2.1),
    Request(
        "32 jump street (such as a letter or package) an envelope with an illegible address.",
        2.1),
    Request("Common drive", 2.1),
  ];

  final List _dummyListOfCard = [
    RequestCard(Request("925 Hilltop dr", 2.1), 40.425869, -86.908066),
    RequestCard(Request("something", 3.1), 40.025869, -84.908066),
    RequestCard(Request("yes", 1.1), 38.425869, -80.908066),
    RequestCard(Request("candice st", 1.3), 40.215869, -90.928066),
    RequestCard(Request("chocoma dr", 5.1), 30.425869, -84.902066),
    RequestCard(Request("23 jump street st", 0.6), 39.325869, -83.908096),
  ];

  addRe(request) {
    setState(() {
      _dummyListOfRequest.insert(0, request);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walk with me',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: const HomePage(),
      routes: {
        '/signinpage': (context) => SignInScreen(),
        '/mainpage': ((context) => MainPage(_dummyListOfCard, addRe)),
        // '/chatroom': ((context) => ChatPage())
      },
    );
  }
}
