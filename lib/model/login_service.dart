import 'package:test_app/utils/config.dart';

class LoginService {
  static bool login(String username, String password) {
    if (username == "test_user@meragi.com" && password == "meragi_test") {
      Config.instance.prefs.setBool("login", true);
      return true;
    }
    return false;
  }

  static void logout() async {
    Config.instance.prefs.setBool("login", false);
  }
}
