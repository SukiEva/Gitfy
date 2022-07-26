import 'package:gitfy/data/local_data.dart';
import 'package:gitfy/data/repo_data.dart';

import '../models/data.dart';

class Dao {
  final _repoData = RepoData();
  final _localData = LocalData();

  Future<List<Data>> getRemote() async {
    return _repoData.getAll();
  }

  Future<List<Data>> getLocal() async {
    return _localData.getAll();
  }
}
