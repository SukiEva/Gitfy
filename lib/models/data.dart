import 'package:json_annotation/json_annotation.dart';
import "repo.dart";
import "release.dart";
part 'data.g.dart';

@JsonSerializable()
class Data {
  Data();

  late Repo repo;
  late List<Release> releases;
  late String desp;
  late String readme;
  late String updatedAt;
  
  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
