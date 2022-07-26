// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data()
  ..repo = Repo.fromJson(json['repo'] as Map<String, dynamic>)
  ..releases = (json['releases'] as List<dynamic>)
      .map((e) => Release.fromJson(e as Map<String, dynamic>))
      .toList()
  ..desp = json['desp'] as String
  ..readme = json['readme'] as String
  ..updatedAt = json['updatedAt'] as String;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'repo': instance.repo,
      'releases': instance.releases,
      'desp': instance.desp,
      'readme': instance.readme,
      'updatedAt': instance.updatedAt,
    };
