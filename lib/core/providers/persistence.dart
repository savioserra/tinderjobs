import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService {
  static const String _keyStore = "app-data";
  static Map<String, dynamic> _data;

  Future<Map<String, dynamic>> get data async {
    if (_data == null) {
      var shared = await SharedPreferences.getInstance();
      var persisted = shared.getString(_keyStore);

      _data = persisted == null ? {} : jsonDecode(persisted);
    }

    return _data;
  }

  Future<String> get token async => (await data)["token"];

  set data(dynamic value) => SharedPreferences.getInstance()
      .then((prefs) => prefs.setString(_keyStore, jsonEncode(value)));
}
