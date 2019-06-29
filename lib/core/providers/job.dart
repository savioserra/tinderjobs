import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tinderjobs/core/models/job.dart';
import 'package:tinderjobs/core/providers/api/api.dart';
import 'package:tinderjobs/core/providers/api/graphql/query.dart' as Query;
import 'package:tinderjobs/core/providers/setup.dart';
import 'package:tinderjobs/core/view_models/login.dart';

class JobService extends ChangeNotifier {
  final _api = Injection.locate<Api>();
  final List<Job> availableJobs = [];
  Status _status;

  JobService() {
    getAvailableJobs();
  }

  Future<void> getAvailableJobs() async {
    status = Status.processing;

    var result = await _api.client.query(QueryOptions(
      document: Query.getJobs,
    ));

    if (result.data != null) {
      var jobs = List<Job>.from(
        result.data["me"]["availableJobs"].map(Job.fromJson),
      );

      availableJobs.addAll(jobs.where((j) => !availableJobs.contains(j)));
    }

    status = Status.idle;
  }

  Status get status => _status;
  set status(Status status) {
    _status = status;
    notifyListeners();
  }
}
