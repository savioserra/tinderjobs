import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jobtinder/core/models/company.dart';
import 'package:jobtinder/core/models/job.dart';
import 'package:jobtinder/core/services/api/api.dart';
import 'package:jobtinder/core/services/api/graphql/query.dart' as Query;
import 'package:jobtinder/core/view_models/login.dart';

class JobSearchModel extends ChangeNotifier {
  Api _api;
  List<Job> availableJobs;
  Status status;

  JobSearchModel(Api api) : _api = api {
    availableJobs = [];
    getAvailableJobs();
  }

  Future<void> getAvailableJobs() async {
    status = Status.processing;
    notifyListeners();

    var result = await _api.client.query(QueryOptions(
      document: Query.getJobs,
    ));

    if (result.data != null) {
      var jobs = List<Job>.from(
        result.data["me"]["availableJobs"].map(
          (j) => Job(
                title: j["title"],
                remuneration: j["remuneration"].toDouble(),
                tags: List<String>.from(j["tags"]),
                description: j["description"],
                weekHours: j["weekHours"],
                weekDays: j["weekDays"],
                company: Company(
                  name: j["company"]["name"],
                  avatarUrl: j["company"]["avatarUrl"],
                ),
              ),
        ),
      );

      availableJobs.addAll(jobs.where((j) => !availableJobs.contains(j)));
    }

    status = Status.idle;
    notifyListeners();
  }
}
