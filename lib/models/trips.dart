import "package:json_annotation/json_annotation.dart";
part "trips.g.dart";

@JsonSerializable()
class Trip {
  int id;
  String title;
  String? description;
  String? image;
  Trip({
    required this.id,
    required this.title,
    this.description,
    this.image,
  });

  factory Trip.fromJson(Map<String, dynamic> json) =>
      _$TripFromJson(json); // creats a book: json => book
  Map<String, dynamic> toJson() =>
      _$TripToJson(this); // creat a json: book => json
}
