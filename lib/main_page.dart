import 'package:flutter/material.dart';
import 'package:walk/helper/house_card.dart';
import 'package:walk/model/request.dart';

class MainPage extends StatelessWidget {
  final List<Request> _listOfRequest;

  MainPage(this._listOfRequest);
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
              child: Center(
                child: Text(
                  "Requests",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.7,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: SizedBox(
                          height: mediaQuery.height * 0.2,
                          child: HouseCard(
                            _listOfRequest[index].address,
                            "2.1km",
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _listOfRequest.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
