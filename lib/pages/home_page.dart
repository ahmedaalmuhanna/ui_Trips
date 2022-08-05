// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trips_iu/Widget/drawer.dart';
import 'package:trips_iu/Widget/trips_card.dart';
import 'package:trips_iu/providers/trip_provider.dart';
import 'package:trips_iu/service/trips_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(title: Center(child: Text("Explore"))),
      // show list "TimeLine"
      // each trip has
      body: Container(
          width: 900,
          child: FutureBuilder(
              future: context.read<TripProvider>().getTripsdFromService(),
              // ignore: curly_braces_in_flow_control_structures
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                if (snapshot.error != null)
                  return Text("Error");
                else
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: context.watch<TripProvider>().myTrips.length,
                      itemBuilder: (context, index) => TripsCard(
                          myTrip:
                              context.watch<TripProvider>().myTrips[index]));
              })),
    );
  }

  // Card(
  //                   margin: EdgeInsets.only(top: 25),
  //                   child: Column(children: [
  //                     Align(
  //                       alignment: AlignmentDirectional.bottomStart,
  //                       child: Container(
  //                         child: InkWell(
  //                             onTap: () {
  //                               print("username");
  //                             },
  //                             child: InkWell(
  //                               onTap: () {
  //                                 context
  //                                     .read<TripProvider>()
  //                                     .getTripsdFromService();
  //                                 // context.read<TripProvider>().printTrips();
  //                                 print("username");
  //                               },
  //                               child: Row(
  //                                 // ignore: prefer_const_literals_to_create_immutables
  //                                 children: [
  //                                   Padding(
  //                                     padding: const EdgeInsets.all(8.0),
  //                                     child: CircleAvatar(
  //                                       radius: 28,
  //                                       backgroundImage: NetworkImage(
  //                                           "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
  //                                       backgroundColor: Colors.blue,
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     "username",
  //                                   ),
  //                                 ],
  //                               ),
  //                             )),
  //                       ),
  //                     ),
  //                     InkWell(
  //                       onTap: () {
  //                         print("image");
  //                       },
  //                       child: Image.network(
  //           "https://images.pexels.com/photos/1133957/pexels-photo-1133957.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  //     ),
  //     Text(
  //       context.read<TripProvider>().myTrips[0].title,
  //       maxLines: 2,
  //     )
  //   ]),
  // ),
}
