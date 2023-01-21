import 'package:flutter/material.dart';

class NormalCard extends StatelessWidget {
  String address;
  String distance;
  String category;
  String name;

  NormalCard(this.name, this.address, this.distance, this.category);

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
              width: size.width * 0.8,
              height: size.height * 0.1,
              child: Text(
                name,
                style: TextStyle(
                  letterSpacing: 0.6,
                  fontSize: size.width * 0.1 * 0.5,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.2,
              child: Row(
                children: [
                  Icon(Icons.food_bank, size: 20),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: size.width * 0.1 * 0.3,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 80,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.2,
              child: Text(
                address,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.height * 0.1 * 0.2,
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
                  distance,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
