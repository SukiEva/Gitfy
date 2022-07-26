import 'package:json_annotation/json_annotation.dart';
import "asset.dart";
part 'release.g.dart';

@JsonSerializable()
class Release {
  Release();

  late String url;
  late String tag;
  late String name;
  late String body;
  late bool preRelease;
  late String publishAt;
  late List<Asset> assets;
  
  factory Release.fromJson(Map<String,dynamic> json) => _$ReleaseFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}
