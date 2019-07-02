import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String avatarUrl;
  String email;

  double rating;

  User({
    this.avatarUrl,
    this.email,
    this.rating,
  });

  static User fromJson(dynamic data) {
    return User(
      avatarUrl: data["avatarUrl"],
      email: data["email"],
      rating: data["rating"].toDouble(),
    );
  }

  copy(User user) {
    this
      ..avatarUrl = user.avatarUrl
      ..rating = user.rating
      ..email = user.email;
  }
}
