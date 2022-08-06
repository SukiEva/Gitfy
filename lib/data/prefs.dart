import 'package:gitfy/common/global.dart';
import 'package:gitfy/models/repo.dart';

class Prefs {
  final _prefs = Global.sharedPreferences;

  String _buildKey(Repo repo) {
    return "${repo.platform}:${repo.owner}:${repo.repo}";
  }


  mark(Repo repo, String tag) async {
    _prefs.setString(_buildKey(repo), tag);
  }
}
