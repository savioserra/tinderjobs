import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jobtinder/core/services/persistence.dart';

class Api {
  static const serverEndpoint = 'http://34.68.91.49';
  final PersistenceService _persistenceService;

  GraphQLClient client;

  Api(PersistenceService persist) : _persistenceService = persist {
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
