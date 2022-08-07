import 'package:gitfy/data/local_data.dart';
import 'package:gitfy/data/remote_data.dart';

import '../models/data.dart';
import '../models/repo.dart';

class Dao {
  final _remoteData = RemoteData();
  final _localData = LocalData();

  Future<List<Data>> getRemote() async {
    return _remoteData.getAll();
  }

  Future<List<Data>> getLocal() async {
    return _localData.getAll();
  }

  Future<bool> follow(List<String> link) async {
    var repo = Repo();
    repo.platform = link[0].substring(0,6);
    repo.owner = link[1];
    repo.repo = link[2];
    return _remoteData.follow(repo);
  }

  Future<String?> register() async {
    return _remoteData.register();
  }
}
