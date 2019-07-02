import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tinderjobs/core/models/user.dart';
import 'package:tinderjobs/core/providers/api/api.dart';
import 'package:tinderjobs/core/providers/api/graphql/mutation.dart'
    as Mutation;
import 'package:tinderjobs/core/providers/persistence.dart';
import 'package:tinderjobs/core/providers/setup.dart';

class AuthService {
  final _api = Injection.locate<Api>();
  final _persistenceService = Injection.locate<PersistenceService>();
  final _user = Injection.locate<User>();

  String _token;

  AuthService();

  Future<String> login(String email, String password) async {
    var result = await _api.client.query(
      QueryOptions(document: Mutation.login, variables: {
        "email": email.trim().toLowerCase(),
        "password": password,
      }),
    );

    if (result.data != null) {
      _user.copy(User.fromJson(result.data["login"]["user"]));
      _token = result.data["login"]["token"];

      await _persistenceService.setData(result.data["login"]);
      return token;
    }

    return null;
  }

  String get token => _token;
}
