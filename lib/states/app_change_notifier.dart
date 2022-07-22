import 'package:flutter/material.dart';
import 'package:gitfy/models/application.dart';

import '../common/global.dart';

class AppChangeNotifier extends ChangeNotifier {

  Application get application => Global.application;

  @override
  void notifyListeners() {
    Global.saveApplication(); //保存app设置变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
