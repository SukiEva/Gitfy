import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/data.dart';
import '../models/result.dart';

class LocalData {
  Future<List<Data>> getAll() async {
    try {
      Map<String, dynamic> data = json.decode(await read());
      var result = Result.fromJson(data);
      List<Data> list = [];
      for (var element in result.data!) {
        list.add(element);
      }
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/repos.json');
  }

  save(String data) async {
    await (await _getLocalFile()).writeAsString(data);
  }

  Future<String> read() async {
    try {
      File file = await _getLocalFile();
      return await file.readAsString();
    } on FileSystemException {
      return "";
    }
  }
}
