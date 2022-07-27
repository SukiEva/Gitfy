import 'package:gitfy/common/global.dart';
import 'package:gitfy/data/local_data.dart';
import 'package:gitfy/data/remote_data.dart';

import '../models/data.dart';

class Dao {
  final _repoData = RemoteData();
  final _localData = LocalData();
  final _prefs = Global.sharedPreferences;

  Future<List<Data>> getRemote() async {
    return _repoData.getAll();
  }

  Future<List<Data>> getLocal() async {
    return _localData.getAll();
  }
}
