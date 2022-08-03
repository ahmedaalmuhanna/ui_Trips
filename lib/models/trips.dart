import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Trips {
  int? id;
  String title;
  String description;
  String image;

  Trips({
    this.id,
    required this.title,
    required this.description,
    required this.image,
  });
}
