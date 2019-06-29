import 'package:get_it/get_it.dart';
import 'package:tinderjobs/core/models/user.dart';
import 'package:tinderjobs/core/providers/api/api.dart';
import 'package:tinderjobs/core/providers/auth.dart';
import 'package:tinderjobs/core/providers/job.dart';
import 'package:tinderjobs/core/providers/persistence.dart';

class Injection {
  static final locate = GetIt();
  static bool initialized = false;

  static void setup() {
    if (initialized) {
      throw "Injection already initialized.";
    }

    locate.registerLazySingleton(
      () => PersistenceService(),
    );

    locate.registerLazySingleton(
      () => Api(serverEndpoint: "http://34.68.91.49"),
    );

    locate.registerLazySingleton(
      () => AuthService(),
    );

    locate.registerLazySingleton(
      () => User(),
    );

    locate.registerLazySingleton(
      () => JobService(),
    );

    initialized = true;
  }
}
