// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo()
  ..platform = json['platform'] as String
  ..owner = json['owner'] as String
  ..repo = json['repo'] as String;

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'platform': instance.platform,
      'owner': instance.owner,
      'repo': instance.repo,
    };
