import 'package:flutter/material.dart';
import 'package:walk/model/request.dart';

class MainPage extends StatelessWidget {
  final List<Request> _listOfRequest;

  MainPage(this._listOfRequest);
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (
              context,
              index,
            ) {
              return InkWell(
                child: Card(
                  child: SizedBox(
                    height: mediaQuery.height * 0.13,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: Text("My destination is " +
                          _listOfRequest[index].destination),
                    ),
                  ),
                ),
              );
            },
            itemCount: _listOfRequest.length,
          ),
        ),
      ),
    );
  }
}
