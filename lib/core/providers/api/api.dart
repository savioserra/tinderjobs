import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tinderjobs/core/providers/persistence.dart';
import 'package:tinderjobs/core/providers/setup.dart';

class Api {
  final String serverEndpoint;
  final _persistenceService = Injection.locate<PersistenceService>();

  GraphQLClient client;

  Api({@required this.serverEndpoint}) {
    var httpLink = HttpLink(
      uri: serverEndpoint,
    );

    var authLink = AuthLink(
      getToken: () async => "Bearer ${await _persistenceService.token}",
    );

    var link = authLink.concat(
      httpLink as Link,
    );

    client = GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    );
  }
}
