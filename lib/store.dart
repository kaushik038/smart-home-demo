
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<void> switchValue(value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setBool('switch',value );
}


Future<bool?> getSwitchValue() async {
  final SharedPreferences prefs = await _prefs;
  return prefs.getBool('switch');
}