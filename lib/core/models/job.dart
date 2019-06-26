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

  bool operator ==(o) => o is Job && o.id == id;
  int get hashCode => id.hashCode ^ title.hashCode;
}
