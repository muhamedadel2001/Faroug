import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static final SharedPrefUtil _instance = SharedPrefUtil._privateCons();
  SharedPreferences? _prefs;

  SharedPrefUtil._privateCons();
  factory SharedPrefUtil() {
    return _instance;
  }
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    await _prefs!.setString('user_token', token);
  }

  String? getToken() {
    return _prefs!.getString('user_token');
  }
  Future<void> saveLastOnBoarding(bool boarding) async {
    await _prefs!.setBool('boarding', boarding);
  }

  bool? getLastOnBoarding() {
    return _prefs!.getBool('boarding');
  }
  Future<void> saveCity(String city) async {
    await _prefs!.setString('city', city);
  }

  String? getCity() {
    return _prefs!.getString('city');
  }

  Future<void> saveId(String id) async {
    await _prefs!.setString('id', id);
  }

  String? getId() {
    return _prefs!.getString('id');
  }

  Future<void> removeToken() async {
    await _prefs!.remove('user_token');
  }
  Future<void> removeLastOnBoarding() async {
    await _prefs!.remove('boarding');
  }

}
