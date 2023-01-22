import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:walk/model/request_card.dart';

import './model/request.dart';
import './model/user.dart';
import 'package:walk/sign_in_screen.dart';
import 'package:geolocator/geolocator.dart';

import 'package:walk/main_page.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
// Future<RequestCard> fetchAlbum() async {
//   final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

//   if (response.statusCode == 200) {
//     return RequestCard.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
const URL = 'https://jsonplaceholder.typicode.com/photos';

Future<List<RequestCard>> fetchRequest(http.Client client) async {
  final response = await client.get(Uri.parse(URL));
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((myMap) => RequestCard.fromJson(myMap))
        .toList();
  } else {
    if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Failed to load post!");
    }
  }
}

Future<http.Response> createUser(RequestCard requestCard) {
  return http.post(
    Uri.parse(URL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'address': requestCard.request.address,
      'distance': requestCard.request.distance.toString(),
      'longitude': requestCard.longtitude.toString(),
      'latitude': requestCard.latitude.toString(),
    }),
  );
}

const URLU = "";

Future<List<UserInfo>> fetchUsers(http.Client client) async {
  final response = await client.get(Uri.parse(URL));
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((myMap) => UserInfo.fromJson(myMap))
        .toList();
  } else {
    if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Failed to load post!");
    }
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

  List<UserInfo> _dummyListOfUsers = [
    UserInfo("479", "a Brown", "2022", "abrown_2022@purdue.edu", "brownie"),
    UserInfo("480", "Tuan Le", "2025", "tuanle_2025@purdue.edu", "tuantuan1"),
    UserInfo(
        "481", "Khoi Pham", "2025", "khoipham_2025@purdue.edu", "khoipham2003"),
    UserInfo("482", "b Harvard", "2024", "bharvard_2024@purdue.edu",
        "harvardisgood"),
    UserInfo(
        "483", "Dat Vuong", "2023", "datvuong_2023@purdue.edu", "datvuong"),
  ];

  final List _dummyListOfCard = [
    RequestCard(Request("925 Hilltop dr", 2.1), 40.425869, -86.908066),
    RequestCard(Request("478 Blackburn St.Adrian, MI 49221", 3.1), 40.025869,
        -84.908066),
    RequestCard(Request("55 N. Fieldstone Ave. Mishawaka, IN 46544", 1.1),
        38.425869, -80.908066),
    RequestCard(Request("9609 South Gregory St. Owosso, MI 48867", 1.3),
        40.215869, -90.928066),
    RequestCard(Request("411 Golden Star St.Mocksville, NC 27023", 5.1),
        30.425869, -84.902066),
    RequestCard(Request("8815 North Poor House Road Oviedo, FL 32765", 0.6),
        39.325869, -83.908096),
  ];

  addRe(request) {
    setState(
      () {
        _dummyListOfCard.insert(0, RequestCard(request, 38.425869, -80.908066));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walkie Talkie',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: FutureBuilder<List<UserInfo>>(
        future: fetchUsers(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return HomePage();
          } else if (snapshot.hasData) {
            _dummyListOfUsers = snapshot.data!;
            return HomePage();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      routes: {
        'signinpage': (context) => SignInScreen(_dummyListOfUsers),
        'mainpage': ((context) => MainPage(_dummyListOfCard, addRe)),
        // '/chatroom': ((context) => ChatPage())
      },
    );
  }
}
