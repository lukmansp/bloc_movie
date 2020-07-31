class Result {
  Result({
    this.id,
    this.name,
    this.email,
    this.salt,
    this.password,
    this.nameMenu,
    this.accessMenu,
    this.createdAt,
  });
  final int id;
  final String name;
  final String email;
  final String salt;
  final String password;
  final String nameMenu;
  final int accessMenu;
  final DateTime createdAt;
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
