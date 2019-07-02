import 'package:flutter/widgets.dart';
import 'package:tinderjobs/core/providers/auth.dart';
import 'package:tinderjobs/core/providers/setup.dart';
import 'package:tinderjobs/ui/screens/jobs/jobs.dart';

class LoginModel extends ChangeNotifier {
  final _authService = Injection.locate<AuthService>();
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    loading = true;

    var res = await _authService.login(email, password);

    if (res != null) {
      Navigator.pushReplacementNamed(context, Jobs.routeName);
    }

    loading = false;
  }
}
