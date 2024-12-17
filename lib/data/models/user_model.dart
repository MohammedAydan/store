class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? city;
  String? address;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.city,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'city': city,
        'address': address,
      };
}
