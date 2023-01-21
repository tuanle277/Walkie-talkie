import 'package:flutter/material.dart';
import 'package:walk/helper/house_card.dart';
import 'package:walk/helper/normal_card.dart';
import 'package:overlay_support/overlay_support.dart';

import 'chat_room.dart';

class MainPage extends StatefulWidget {
  final List _listOfHouseRequest;

  Function addRe;

  MainPage(
    this._listOfHouseRequest,
    this.addRe,
  );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
// Here you can write your code

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
                    "Class year: 2022 \n do you want to go with this person?",
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
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChatPage();
                          },
                        ),
                      ),
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
                subtitle: const Text('Wants to travel with you'),
                trailing:
                    IconButton(icon: const Icon(Icons.close), onPressed: () {}),
              ),
            ),
          ),
        );
      }, duration: const Duration(milliseconds: 4000));
    });
    final Set _myRequest = {};
    String requestType = "house";
    final _address = TextEditingController();
    Size mediaQuery = MediaQuery.of(context).size;
    bool chosen = false;
    var items = ["house", "other"];
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
                      if (!_myRequest
                          .contains(widget._listOfHouseRequest[index])) {
                        widget._listOfHouseRequest[index].chosen
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
                                            widget._listOfHouseRequest[index]
                                                    .chosen =
                                                !widget
                                                    ._listOfHouseRequest[index]
                                                    .chosen;
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
                                            widget._listOfHouseRequest[index]
                                                    .chosen =
                                                !widget
                                                    ._listOfHouseRequest[index]
                                                    .chosen;
                                          },
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                  ],
                                ),
                              );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: widget._listOfHouseRequest[index].chosen
                            ? Colors.green[300]
                            : Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: mediaQuery.height * 0.2,
                          child: widget._listOfHouseRequest[index].category ==
                                  'house'
                              ? HouseCard(
                                  widget._listOfHouseRequest[index].address,
                                  widget._listOfHouseRequest[index].distance,
                                )
                              : NormalCard(
                                  widget._listOfHouseRequest[index].name,
                                  widget._listOfHouseRequest[index].address,
                                  widget._listOfHouseRequest[index].distance,
                                  widget._listOfHouseRequest[index].category),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: widget._listOfHouseRequest.length,
              ),
            ),
            InkWell(
              onTap: () => {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Color(0xff9D968D),
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
                                    width: mediaQuery.width * 0.3,
                                    child: DropdownButtonFormField(
                                      style: const TextStyle(
                                        color: Colors.amber,
                                      ),
                                      // Initial Value
                                      onChanged: (String? newValue) {
                                        setState(
                                          () {
                                            requestType = newValue!;
                                          },
                                        );
                                      },
                                      onSaved: (String? newValue) {
                                        setState(
                                          () {
                                            requestType = newValue!;
                                          },
                                        );
                                      },
                                      value: requestType,

                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                    ),
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.2,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                    ),
                                    onPressed: () {
                                      if (_address.text.isEmpty) {
                                        return;
                                      }
                                      widget.addRe(requestType, _address.text);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: mediaQuery.height * 0.065,
                                      child: const Text(
                                        "Submit request",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
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
