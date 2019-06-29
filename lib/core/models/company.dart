class Company {
  String name;
  String avatarUrl;

  Company({
    this.name,
    this.avatarUrl,
  });

  static Company fromJson(dynamic json) {
    return Company(
      name: json["name"],
      avatarUrl: json["avatarUrl"],
    );
  }
}
