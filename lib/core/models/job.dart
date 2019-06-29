import 'package:tinderjobs/core/models/company.dart';

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

  static Job fromJson(dynamic json) {
    return Job(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      tags: List<String>.from(json["tags"]),
      matchThreshold: json["matchThreshold"],
      weekDays: json["weekDays"],
      deleted: json["deleted"],
      weekHours: json["weekHours"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      company: Company.fromJson(json["company"]),
      remuneration:
          json["remuneration"] != null ? json["remuneration"].toDouble() : null,
    );
  }
}
