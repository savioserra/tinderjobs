import 'package:flutter/widgets.dart';
import 'package:jobtinder/core/models/job.dart';
import 'package:jobtinder/core/services/api/api.dart';

class JobSearchModel extends ChangeNotifier {
  Api _api;
  List<Job> availableJobs;

  JobSearchModel(Api api) : _api = api {
    availableJobs = [
      Job(title: "Analista"),
    ];
  }

  void getAvailableJobs() {
    availableJobs.removeAt(0);
    availableJobs.add(Job(title: "Teste"));
    notifyListeners();
  }
}
