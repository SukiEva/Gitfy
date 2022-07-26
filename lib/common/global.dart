import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gitfy/data/dao.dart';
import 'package:gitfy/models/application.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static late SharedPreferences _prefs;
  static Application application = Application();
  static late PackageInfo packageInfo;
  static Dao dao = Dao();

  // 持久化 application 信息
  static saveApplication() =>
      _prefs.setString("application", jsonEncode(application.toJson()));

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
    var appPrefs = _prefs.getString("application");
    if (appPrefs != null) {
      try {
        application = Application.fromJson(jsonDecode(appPrefs));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
