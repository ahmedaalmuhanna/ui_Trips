import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trips_iu/models/trips.dart';
import 'package:go_router/go_router.dart';

class TripsCard extends StatelessWidget {
  final Trip myTrip;
  const TripsCard({Key? key, required this.myTrip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text("data"),
        Image.network(myTrip.image!),
        Text(myTrip.title)

        //   // Expanded(
        //   //   child: Image.network(
        //   //     myTrip.image!,
        //   //     fit: BoxFit.cover,
        //   //     width: double.infinity,
        //   //   ),
        //   // ),
        //   Expanded(
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           children: [Text(myTrip.title)]),
        //     ),
        //   )
      ]),
    );
  }
}
