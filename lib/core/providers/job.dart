import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tinderjobs/core/models/job.dart';
import 'package:tinderjobs/core/providers/api/api.dart';
import 'package:tinderjobs/core/providers/api/graphql/mutation.dart'
    as Mutation;
import 'package:tinderjobs/core/providers/api/graphql/query.dart' as Query;
import 'package:tinderjobs/core/providers/setup.dart';
import 'package:tinderjobs/core/view_models/login.dart';

class JobService extends ChangeNotifier {
  final _api = Injection.locate<Api>();
  final List<Job> _availableJobs = [];
  Status _status;

  JobService() {
    refresh();
  }

  Future<void> refresh() async {
    if (status != Status.processing) {
      status = Status.processing;
    }

    var result = await _api.client.query(QueryOptions(
      document: Query.getJobs,
      fetchPolicy: FetchPolicy.noCache,
    ));

    if (result.data != null) {
      var jobs = List<Job>.from(
        result.data["me"]["availableJobs"].map(Job.fromJson),
      );

      this.jobs.addAll(jobs.where((j) => !this.jobs.contains(j)));
    }

    status = Status.idle;
  }

  void like(Job job) async {
    status = Status.processing;

    await _api.client.mutate(
      MutationOptions(
        document: Mutation.like,
        variables: {
          "jobId": job.id,
        },
      ),
    );

    this.jobs.remove(job);

    if (this.jobs.length <= 3) {
      refresh();
    } else {
      status = Status.idle;
    }
  }

  Status get status => _status;
  List<Job> get jobs => _availableJobs;

  set status(Status status) {
    _status = status;
    notifyListeners();
  }
}
