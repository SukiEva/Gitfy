import 'package:gitfy/data/local_data.dart';
import 'package:gitfy/data/remote_data.dart';

import '../models/data.dart';

class Dao {
  final _remoteData = RemoteData();
  final _localData = LocalData();

  Future<List<Data>> getRemote() async {
    return _remoteData.getAll();
  }

  Future<List<Data>> getLocal() async {
    return _localData.getAll();
  }

  Future<String?> register() async {
    return _remoteData.register();
  }
}
