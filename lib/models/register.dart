import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'register.g.dart';

@JsonSerializable()
class Register {
  Register();

  late num code;
  late String message;
  late User data;
  
  factory Register.fromJson(Map<String,dynamic> json) => _$RegisterFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
