import 'package:jobtinder/core/models/company.dart';

class Job {
  Job({
    this.id,
    this.title,
    this.description,
    this.weekDays,
    this.tags,
    this.remuneration,
    this.matchThreshold,
    this.weekHours,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.company,
  });

  String id;
  String title;
  String description;
  String weekDays;
  List<String> tags;

  DateTime createdAt;
  DateTime updatedAt;

  double remuneration;
  double matchThreshold;
  bool deleted;
  int weekHours;

  Company company;

  bool operator ==(o) => o is Job && o.id == id;
  int get hashCode => id.hashCode ^ title.hashCode;
}
