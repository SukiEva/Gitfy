import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gitfy/common/global.dart';
import 'package:gitfy/data/local_data.dart';
import 'package:gitfy/models/index.dart';

class RemoteData {
  final _dio = Dio();
  final _localData = LocalData();
  final String baseUrl = "http://103.151.217.221:9898";

  Future<List<Data>> getAll() async {
    try {
      var response =
          await _dio.get("$baseUrl/api/repo/getByUser", queryParameters: {"uid": Global.application.user});
      if (response.statusCode != 200) return [];
      var result = Result.fromJson(response.data);
      if (result.code != 200 || result.data == null) return [];
      _localData.save(json.encode(result.toJson()));
      List<Data> list = [];
      for (var element in result.data!) {
        list.add(element);
      }
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<String?> register() async {
    try {
      var response = await _dio.post("$baseUrl/api/user/generate");
      if (response.statusCode != 200) return null;
      var register = Register.fromJson(response.data);
      return register.data.uid;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

}
