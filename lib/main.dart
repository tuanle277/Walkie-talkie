import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:walk/model/request_card.dart';

import './model/request.dart';
import './model/user.dart';
import 'dart:math';
import 'package:walk/sign_in_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:walk/model/destination.dart';


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
  static late Position position;

  void _getUserPosition() async {
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      position = userLocation;
    });
  }

  static double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  @override
  void initState() {
    super.initState();
    _getUserPosition();
  }
  
  static final List _dummyListOfDestination = [
    DestinationInfo("925 Hilltop dr", 40.4346622, -86.9234766),
    DestinationInfo("Wilmeth Active Learning Center", 40.4273707, -86.9153639),
    DestinationInfo("Lilly Hall of Life Sciences", 40.4234801, -86.9202012),
    DestinationInfo("402 Brown Street", 40.4231753, -86.9100458),
    DestinationInfo("3630 South Street", 40.4180692, -86.879096)
  ];

  final List _dummyListOfCard = [
    RequestCard(_dummyListOfDestination[0],
                calculateDistance(_dummyListOfDestination[0].latitude,
                                  _dummyListOfDestination[0].longitude,
                                  position.latitude, position.longitude),
                position.latitude, position.longitude),

    RequestCard(_dummyListOfDestination[1],
                calculateDistance(_dummyListOfDestination[1].latitude,
                                  _dummyListOfDestination[1].longitude,
                                  position.latitude, position.longitude),
                position.latitude, position.longitude),

    RequestCard(_dummyListOfDestination[2],
                calculateDistance(_dummyListOfDestination[2].latitude,
                                  _dummyListOfDestination[2].longitude,
                                  position.latitude, position.longitude),
                position.latitude, position.longitude),

    RequestCard(_dummyListOfDestination[3],
                calculateDistance(_dummyListOfDestination[3].latitude,
                                  _dummyListOfDestination[3].longitude,
                                  position.latitude, position.longitude),
                position.latitude, position.longitude),

    RequestCard(_dummyListOfDestination[4],
                calculateDistance(_dummyListOfDestination[4].latitude,
                                  _dummyListOfDestination[4].longitude,
                                  position.latitude, position.longitude),
                position.latitude, position.longitude),

  ];

  addRe(request) {
    setState(() {
      _dummyListOfCard.insert(0, request);
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
