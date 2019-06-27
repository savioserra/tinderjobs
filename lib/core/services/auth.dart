import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/core/services/api/api.dart';
import 'package:jobtinder/core/services/api/graphql/mutation.dart' as Mutation;
import 'package:jobtinder/core/services/persistence.dart';

class AuthService {
  final Api _api;
  final PersistenceService _persistenceService;
  final User _user;

  AuthService(this._api, this._persistenceService, this._user);

  Future<String> login(String email, String password) async {
    var result = await _api.client.query(
      QueryOptions(document: Mutation.login, variables: {
        "email": email.trim().toLowerCase(),
        "password": password,
      }),
    );

    if (result.data != null) {
      _user.fromJson(result.data["login"]);
      _persistenceService.data = result.data["login"];

      return _user.token;
    }

    return null;
  }
}
