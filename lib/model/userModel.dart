class UserModel {
  final int id;
  final String name;
  final String email;
  final String role;
  final int credit;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.credit,
  });

  UserModel.fromJson({required Map<String, dynamic> json})
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        role = json['role'],
        credit = json['credit'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'credit': credit,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? role,
    int? credit,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      credit: credit ?? this.credit,
    );
  }
}
