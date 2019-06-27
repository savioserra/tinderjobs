import 'package:flutter/widgets.dart';
import 'package:jobtinder/core/services/auth.dart';
import 'package:jobtinder/ui/screens/job_search/job_search.dart';

class LoginModel extends ChangeNotifier {
  final AuthService _authService;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  LoginModel(this._authService);

  void login(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    loading = true;

    var res = await _authService.login(email, password);

    if (res != null) {
      Navigator.pushReplacementNamed(context, JobSearch.routeName);
    }

    loading = false;
  }
}
