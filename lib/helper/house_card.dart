import 'package:flutter/material.dart';

import '../model/request.dart';

class HouseCard extends StatefulWidget {
  String address;
  String distance;
  HouseCard(this.address, this.distance);

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.address,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                  width: size.width * 0.28,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.house,
                      size: 40,
                    ),
                    Icon(
                      Icons.add_location_outlined,
                      size: 20,
                    ),
                    Text(
                      widget.distance,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
