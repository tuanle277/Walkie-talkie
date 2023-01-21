import 'package:flutter/material.dart';

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
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: size.height * 0.02,
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Text(
                "My house",
                style: TextStyle(
                  fontSize: size.width * 0.1 * 0.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 60,
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Text(
                widget.address,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.1 * 0.35,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.0625,
            left: 20,
            child: SizedBox(
              width: size.width * 0.65,
              child: Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Column(
              children: [
                const Icon(
                  Icons.add_location_outlined,
                  size: 20,
                ),
                Text(
                  widget.distance,
                ),
              ],
            ),
          ),
          // Positioned(
          //   right: 20,
          //   top: 65,
          //   child: Text(
          //     requestedText,
          //   ),
          // )
        ],
      ),
    );
  }
}
