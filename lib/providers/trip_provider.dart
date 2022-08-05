import 'package:flutter/material.dart';
import 'package:trips_iu/models/trips.dart';
import 'package:trips_iu/service/trips_service.dart';

class TripProvider extends ChangeNotifier {
  List<Trip> myTrips = [];

  Future<List> getTripsdFromService() async {
    myTrips = await TripsService().getTrips();
    notifyListeners();
    return myTrips;
  }

  // Future<void> printTrips() async {
  //   print(await TripsService().getTrips);
  // }
}
