// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// returns Trip

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

// returns Json .. Map == Json

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
