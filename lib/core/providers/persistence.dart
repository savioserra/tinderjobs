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

  Future<void> setData(dynamic value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyStore, jsonEncode(value));

    _data = value;
  }
}
