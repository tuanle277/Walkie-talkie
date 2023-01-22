import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width = 100;

  void changeScreen(String screenName) {
    setState(() {
      _width = 280;
    });
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, screenName);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () => changeScreen("/signinpage"),
        child: SizedBox(
          height: mediaQuery.height,
          width: mediaQuery.width,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                top: 180,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Walkie Talkie',
                    style: TextStyle(
                      fontSize: mediaQuery.width / 8,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffc28e0e),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: 270,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedContainer(
                    duration: const Duration(
                      seconds: 2,
                    ),
                    curve: Curves.fastOutSlowIn,
                    height: 2,
                    width: _width,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned.fill(
                top: 400,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              FadeAnimatedText(
                                "Press anywhere to start",
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                            pause: const Duration(milliseconds: 50),
                            repeatForever: true,
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
