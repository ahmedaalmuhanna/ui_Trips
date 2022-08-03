// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Profile {
  String? image;
  String? bio;
  int? totalTrips;

  Profile({
    this.image,
    this.bio,
    this.totalTrips,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'bio': bio,
      'totalTrips': totalTrips,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      image: map['image'] != null ? map['image'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      totalTrips: map['totalTrips'] != null ? map['totalTrips'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
