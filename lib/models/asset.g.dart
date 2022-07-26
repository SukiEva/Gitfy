// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset()
  ..name = json['name'] as String
  ..download = json['download'] as String;

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'name': instance.name,
      'download': instance.download,
    };
