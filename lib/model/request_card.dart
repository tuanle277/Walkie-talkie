import 'package:walk/model/destination.dart';

class RequestCard {
  final DestinationInfo address;
  final double distance;
  final double currLongitude;
  final double currLatitude;

  RequestCard(this.address, this.distance, this.currLatitude, this.currLongitude);
}
