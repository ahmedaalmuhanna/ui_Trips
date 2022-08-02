import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Trips {
  int id;
  String title;
  String description;
  String image;

  Trips({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory Trips.fromMap(Map<String, dynamic> map) {
    return Trips(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trips.fromJson(String source) =>
      Trips.fromMap(json.decode(source) as Map<String, dynamic>);
}
