import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gitfy/data/local_data.dart';
import 'package:gitfy/models/index.dart';

class RemoteData {
  final _dio = Dio();
  final _localData = LocalData();
  final String baseUrl = "http://103.151.217.221:9898";

  Future<List<Data>> getAll() async {
    try {
      var response = await _dio.get("$baseUrl/api/repo/getAll");
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
      return [];
    }
  }
}
