import 'dart:math';

import 'package:flutter/material.dart';
import 'package:walk/helper/des_card.dart';
import 'package:overlay_support/overlay_support.dart';
import './model/request.dart';
import 'chat_room.dart';

import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:collection/collection.dart';

class MainPage extends StatefulWidget {
  final List _listOfCard;

  Function addRe;

  MainPage(
    this._listOfCard,
    this.addRe,
  );

  @override
  State<MainPage> createState() => _MainPageState();
}

final List _myRequest = [];

TwilioFlutter twilioFlutter = TwilioFlutter(
    accountSid:
        'AC80ec82d005d37e1db39f0738146bacd4', // replace *** with Account SID
    authToken:
        'b9c257929cde633edc422e2c9cf40589', // replace xxx with Auth Token
    twilioNumber: '+13133854824' // replace .... with Twilio Number
    );

void sendSMS(String number) async {
  twilioFlutter.sendSMS(
      toNumber: number, messageBody: 'Sarah wants to walk with you!');
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    int appear = Random().nextInt(2000) + 3000;
    Function eq = const ListEquality().equals;

    Future.delayed(Duration(milliseconds: appear), () {
// Here you can write your code
      sendSMS("+17657122276");

      showOverlayNotification((context) {
        return Card(
          color: Colors.amber,
          child: InkWell(
            onTap: (() {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Sarah Brown',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: const Text(
                    "Class year: 2022 \n\nDo you want to walk with this person?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );
            }),
            child: SafeArea(
              child: ListTile(
                leading: SizedBox.fromSize(
                  size: const Size(40, 40),
                  child: ClipOval(
                    child: Container(
                      color: Colors.blue[300],
                    ),
                  ),
                ),
                title: const Text(
                  'Sarah',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text('Wants to walk with you!'),
                trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      OverlaySupportEntry.of(context)?.dismiss();
                    }),
              ),
            ),
          ),
        );
      }, duration: const Duration(milliseconds: 5000));
    });
    String requestType = "house";
    final _radiusController = TextEditingController();
    final _address = TextEditingController();
    Size mediaQuery = MediaQuery.of(context).size;
    bool chosen = false;
    Color cardColor = chosen ? Colors.green[300]! : Colors.grey[100]!;
    return Scaffold(
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mediaQuery.height * 0.86,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return InkWell(
                    onTap: () {
                      bool _exist = false;
                      // print(_myRequest);
                      for (int i = 0; i < _myRequest.length; ++i) {
                        if (_myRequest[i] ==
                            widget._listOfCard[index].request) {
                          _exist = true;
                          break;
                        }
                      }
                      // print(_exist);
                      if (!_exist) {
                        widget._listOfCard[index].request.chosen
                            ? showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      'You don\'t want to walk with this person anymore?'),
                                  content: const Text(
                                    "You have to send the request again should you change your mind",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            widget._listOfCard[index].request
                                                    .chosen =
                                                !widget._listOfCard[index]
                                                    .request.chosen;
                                          },
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              )
                            : showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      'You want to walk with this person?'),
                                  content: const Text(
                                    "Your information will be shared should you choose \"Yes\"",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            widget._listOfCard[index].request
                                                    .chosen =
                                                !widget._listOfCard[index]
                                                    .request.chosen;
                                          },
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChatPage(
                                  widget._listOfCard[index].request.address);
                            },
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: widget._listOfCard[index].request.chosen
                            ? Colors.green[300]
                            : Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                            height: mediaQuery.height * 0.2,
                            child: DesCard(
                              widget._listOfCard[index].request.address,
                              "${widget._listOfCard[index].request.distance}km",
                            )),
                      ),
                    ),
                  );
                },
                itemCount: widget._listOfCard.length,
              ),
            ),
            InkWell(
              onTap: () => {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: const Color(0xff9D968D),
                      height: mediaQuery.height * 0.35,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: mediaQuery.height * 0.1,
                              width: mediaQuery.width * 0.8,
                              child: TextField(
                                decoration: const InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelText: "Address",
                                  labelStyle: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                controller: _address,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: mediaQuery.width * 0.8,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mediaQuery.width * 0.4,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        labelText: "exposure radius",
                                        labelStyle: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      controller: _radiusController,
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.04,
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.04,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                    ),
                                    onPressed: () {
                                      if (_address.text.isEmpty ||
                                          _radiusController.text.isEmpty) {
                                        return;
                                      }
                                      var newRe = Request(_address.text,
                                          double.parse(_radiusController.text));

                                      _myRequest.add(newRe);
                                      widget.addRe(newRe);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: mediaQuery.width * 0.2,
                                      height: mediaQuery.height * 0.065,
                                      child: Text(
                                        "Submit request",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: mediaQuery.width * 0.025),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              },
              child: Container(
                height: mediaQuery.height * 0.14,
                width: mediaQuery.width,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      100,
                    ),
                    topRight: Radius.circular(
                      100,
                    ),
                  ),
                  color: Color(0xffC28E0E),
                ),
                child: Center(
                  child: Text(
                    "New Request",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
