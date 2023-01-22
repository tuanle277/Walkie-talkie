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

List<RequestCard> parseRequest(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<RequestCard>((json) => RequestCard.fromJson(json)).toList();
}

Future<List<RequestCard>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(URL));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parseRequest(response.body);
}

// fetchRequestData(http.Client client) async {
//   var url = Uri.parse();
//   var response = http.get(url);
//   var data = jsonDecode(response.body);
// }

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

  final List<UserInfo> _dummyListOfUsers = [
    UserInfo("479", "a Brown", "2022", "abrown_2022@purdue.edu", "brownie"),
    UserInfo("480", "Tuan Le", "2025", "tuanle_2025@purdue.edu", "tuantuan1"),
    UserInfo(
        "481", "Khoi Pham", "2025", "khoipham_2025@purdue.edu", "khoipham2003"),
    UserInfo("482", "b Harvard", "2024", "bharvard_2024@purdue.edu",
        "harvardisgood"),
    UserInfo(
        "483", "Dat Vuong", "2023", "datvuong_2023@purdue.edu", "datvuong"),
  ];

  List _dummyListOfCard = [
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
      home: FutureBuilder<List<RequestCard>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return HomePage();
          } else if (snapshot.hasData) {
            _dummyListOfCard = snapshot.data!;
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
