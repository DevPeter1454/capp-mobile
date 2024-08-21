import 'dart:convert';

class Complaint {
  final String id;
  final String mdaId;
  final String firstName;
  final String lastName;
  final String complain;
  final String email;
  final String gender;
  final String phone;
  final String age;
  final String createdAt;

  Complaint(
      {required this.createdAt,
      required this.id,
      required this.mdaId,
      required this.firstName,
      required this.lastName,
      required this.complain,
      required this.email,
      required this.gender,
      required this.phone,
      required this.age});

  Map<String, dynamic> toMap() {
    return {
      "mdaId": mdaId,
      "first_name": firstName,
      "other_name": lastName,
      "complain": complain,
      "email": email,
      "gender": gender,
      "phone": phone,
      "age": age
    };
  }

  factory Complaint.fromMap(Map<String, dynamic> map) {
    return Complaint(
      id: map["_id"] ?? "",
      createdAt: map['createdAt'] ?? "",
      mdaId: map['mdaId'] ?? "",
      firstName: map['first_name'] ?? "",
      lastName: map['other_name'] ?? "",
      complain: map['complain'] ?? "",
      email: map['email'] ?? "",
      gender: map['gender'] ?? "",
      phone: map['phone'] as String,
      age: map['age'] ?? "",
    );
  }

  String toJson() => toMap().toString();

  factory Complaint.fromJson(String jsonString) =>
      Complaint.fromMap(json.decode(jsonString));
}
