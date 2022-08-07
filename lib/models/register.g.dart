// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register()
  ..code = json['code'] as num
  ..message = json['message'] as String
  ..data = User.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
