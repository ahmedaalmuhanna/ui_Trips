import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
import 'package:trips_iu/models/trips.dart';
import 'package:trips_iu/service/client.dart';

class TripsService {
  final _dio = Dio();
  List<Trip> myTrips = [];
  String x = '';

  Future<List<Trip>> getTrips() async {
    try {
      Response res = await Client.dio.get("trip-list/");
      print(res.data);
      myTrips = (res.data as List).map((e) => Trip.fromJson(e)).toList();
    } on DioError catch (error) {
      print("\n ****eroor****\n");
      print(error.message);
    }

    print("**************************");
    print(myTrips[2].description);

    print("**************************");

    return myTrips;
  }
}
