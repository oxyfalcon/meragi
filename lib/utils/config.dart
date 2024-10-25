import 'package:shared_preferences/shared_preferences.dart';

class Config {
  Config._();
  static final Config _obj = Config._();
  static Config get instance => _obj;

  late SharedPreferences prefs;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }
}
