import 'package:walk/model/request.dart';

class RequestCard {
  final Request request;
  final double longtitude;
  final double latitude;

  RequestCard(this.request, this.latitude, this.longtitude);

  factory RequestCard.fromJson(Map<String, dynamic> json) {
    return RequestCard(
      Request(json['address'], json['distance']),
      json['longtitude'],
      json['latitude'],
    );
  }

  Map<String, dynamic> toJson() => {
        'address': request.address,
        'distance': request.distance,
        'longitude': longtitude,
        'latitude': latitude,
      };
}
