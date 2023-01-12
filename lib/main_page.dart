import 'package:flutter/material.dart';
import 'package:walk/helper/house_card.dart';
import 'package:walk/helper/normal_card.dart';
import 'package:walk/model/house_request.dart';

class MainPage extends StatelessWidget {
  final List _listOfHouseRequest;

  MainPage(this._listOfHouseRequest);
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mediaQuery.height * 0.16,
              child: const Center(
                child: Text(
                  "Requests",
                  style: TextStyle(
                    fontSize: 22,
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
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('You want to walk with this person?'),
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
                            onPressed: () => Navigator.pop(context, 'Sign Out'),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                            height: mediaQuery.height * 0.2,
                            child:
                                _listOfHouseRequest[index].category == 'house'
                                    ? HouseCard(
                                        _listOfHouseRequest[index].address,
                                        "2.1km",
                                      )
                                    : NormalCard(
                                        _listOfHouseRequest[index].name,
                                        _listOfHouseRequest[index].address,
                                        _listOfHouseRequest[index].distance,
                                        _listOfHouseRequest[index].category)),
                      ),
                    ),
                  );
                },
                itemCount: _listOfHouseRequest.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
