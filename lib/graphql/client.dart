import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink httpLink = HttpLink(
  uri: 'https://api.github.com/graphql',
);

final AuthLink authLink = AuthLink(
  getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  // OR
  // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
);

final Link link = authLink.concat(httpLink as Link);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);
