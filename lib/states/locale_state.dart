import 'dart:ui';

import 'app_change_notifier.dart';

class LocaleState extends AppChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale? getLocale() {
    if (application.locale == null) return null;
    if (application.locale == "en") return const Locale("en");
    var t = application.locale!.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String? get locale => application.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String? locale) {
    if (locale != application.locale) {
      application.locale = locale;
      notifyListeners();
    }
  }
}
