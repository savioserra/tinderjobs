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

  Future<String> get token async {
    return (await data)["token"];
  }

  Future<void> persist() async {
    var shared = await SharedPreferences.getInstance();

    await shared.setString(_keyStore, jsonEncode(data));
  }
}
