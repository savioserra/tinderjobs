import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String token;
  String avatarUrl;
  String email;

  double rating;

  fromJson(dynamic data) {
    avatarUrl = data["user"]["avatarUrl"];
    email = data["user"]["email"];
    rating = data["user"]["rating"];
    token = data["token"];
  }
}
