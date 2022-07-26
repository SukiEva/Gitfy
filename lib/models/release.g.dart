// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release()
  ..url = json['url'] as String
  ..tag = json['tag'] as String
  ..name = json['name'] as String
  ..body = json['body'] as String
  ..preRelease = json['preRelease'] as bool
  ..publishAt = json['publishAt'] as String
  ..assets = (json['assets'] as List<dynamic>)
      .map((e) => Asset.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'url': instance.url,
      'tag': instance.tag,
      'name': instance.name,
      'body': instance.body,
      'preRelease': instance.preRelease,
      'publishAt': instance.publishAt,
      'assets': instance.assets,
    };
