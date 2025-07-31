import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Service{

  const Service({
    required this.label, 
    required this.description, 
    required this.price
  });
  
  @HiveField(0)
  @JsonKey(name: "label")
  final String label;

  @HiveField(1)
  @JsonKey(name: "description")
  final String description;

  @HiveField(2)
  @JsonKey(name: "price")
  final int price;

  factory Service.fromJson(Map<String, dynamic> json)
    => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

}