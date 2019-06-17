import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final HttpLink httpLink = HttpLink(
  uri: 'http://ligapay.tk',
);

final AuthLink authLink = AuthLink(getToken: () async {
  final shared = await SharedPreferences.getInstance();
  final token = shared.getString("user-token");

  return 'Bearer $token';
});

final Link link = authLink.concat(httpLink as Link);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);
