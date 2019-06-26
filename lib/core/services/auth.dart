import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jobtinder/core/services/api/api.dart';
import 'package:jobtinder/core/services/api/graphql/mutation.dart' as Mutation;

class AuthService {
  final Api _api;

  AuthService(Api api) : _api = api;

  Future<String> login(String email, String password) async {
    if (email == null || password == null) {
      return null;
    }

    var result = await _api.client.query(
      QueryOptions(document: Mutation.login, variables: {
        "email": email.trim().toLowerCase(),
        "password": password,
      }),
    );

    if (result.data != null) {
      return result.data["login"]["token"];
    }

    return null;
  }
}
