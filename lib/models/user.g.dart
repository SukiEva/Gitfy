// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..uid = json['uid'] as String
  ..tg = json['tg'] as String
  ..isAdmin = json['isAdmin'] as bool;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'tg': instance.tg,
      'isAdmin': instance.isAdmin,
    };
