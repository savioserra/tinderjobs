import 'package:flutter/material.dart';
import 'package:jobtinder/core/services/auth.dart';

class Login extends ChangeNotifier {
  final AuthService _authService;
  Status _status;

  Login(AuthService authService) : _authService = authService {
    _status = Status.idle;
  }

  Future<String> login(String email, String password) async {
    return _authService.login(email, password);
  }

  set status(Status status) {
    _status = status;
    notifyListeners();
  }

  get status {
    return _status;
  }

  get authService {
    return _authService;
  }
}

enum Status { processing, idle }
