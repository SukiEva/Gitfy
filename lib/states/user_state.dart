import 'package:gitfy/states/app_change_notifier.dart';

class UserState extends AppChangeNotifier {
  String? get user => application.user;

  set user(String? user) {
    if (user != application.user) {
      application.user = user;
      notifyListeners();
    }
  }
}
