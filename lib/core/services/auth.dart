import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jobtinder/core/services/api/api.dart';
import 'package:jobtinder/core/services/api/graphql/mutation.dart' as Mutation;

class AuthService {
  final Api _api;

  AuthService(Api api) : _api = api;

  Future<String> login(String email, String password) async {
    var result = await _api.client.query(
      QueryOptions(document: Mutation.login),
    );

    if (result.data) {
      return result.data["login"]["token"];
    }

    return null;
  }
}
