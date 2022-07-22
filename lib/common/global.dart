import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gitfy/models/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static late SharedPreferences _prefs;
  static Application application = Application();

  // 持久化 application 信息
  static saveApplication() =>
      _prefs.setString("application", jsonEncode(application.toJson()));

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
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
