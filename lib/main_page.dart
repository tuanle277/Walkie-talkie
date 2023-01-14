import 'package:flutter/material.dart';
import 'package:walk/helper/house_card.dart';
import 'package:walk/helper/normal_card.dart';

class MainPage extends StatefulWidget {
  final List _listOfHouseRequest;

  MainPage(this._listOfHouseRequest);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
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
              height: mediaQuery.height * 0.16,
              child: Center(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, "/chatroom"),
                  child: Text(
                    "Requests",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.8,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return InkWell(
                    onTap: () => widget._listOfHouseRequest[index].chosen
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
                                            !widget._listOfHouseRequest[index]
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
                                            !widget._listOfHouseRequest[index]
                                                .chosen;
                                      },
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          ),
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
                                  "2.1km",
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
          ],
        ),
      ),
    );
  }
}
