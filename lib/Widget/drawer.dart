import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      /// https://www.youtube.com/watch?v=SLR8U55FpFQ
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text("Hello accour name",
              style: TextStyle(color: Colors.black)), //Username

          currentAccountPicture: CircleAvatar(
            child: ClipOval(
                child: Image.network(
              "https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            )),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://honeywell.scene7.com/is/image/honeywell/AeroBT-s_414384259_Business-Jet_2880x1440"),
                  fit: BoxFit.cover)),

          accountEmail: null,
        ),
        ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
            onTap: () {
              context.push('/EditPage');
              print("Edit");
            }),
        ListTile(
            leading: Icon(Icons.airplanemode_active),
            title: Text("Trips", style: TextStyle(color: Colors.black)),
            onTap: () {
              context.push("/TripsPage");
              print("Trips");
            }),
      ]),
    );
  }
}
