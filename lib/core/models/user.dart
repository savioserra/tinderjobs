import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String token;
  String avatarUrl;
  String email;

  double rating;
}
