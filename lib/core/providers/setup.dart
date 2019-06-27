import 'package:jobtinder/core/models/user.dart';
import 'package:jobtinder/core/services/api/api.dart';
import 'package:jobtinder/core/services/auth.dart';
import 'package:jobtinder/core/services/persistence.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider<PersistenceService>.value(
    value: PersistenceService(),
  ),
  ChangeNotifierProvider.value(
    value: User(),
  )
];

List<SingleChildCloneableWidget> dependentServices = [
  ProxyProvider<PersistenceService, Api>(
    builder: (context, persistence, api) => Api(persistence),
  ),
  ProxyProvider<Api, AuthService>(
    builder: (context, api, authService) => AuthService(
          api,
          Provider.of(context),
          Provider.of(context),
        ),
  ),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
