// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewPoliticalPartyModel {
  final String id;
  final String name;
  final String description;
  final String logo;
  final List<dynamic> members;
  final List<dynamic> donations;

  NewPoliticalPartyModel({required this.id, required this.name, required this.description, required this.logo, required this.members, required this.donations});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'members': members,
      'donations': donations,
    };
  }

  factory NewPoliticalPartyModel.fromMap(Map<String, dynamic> map) {
    return NewPoliticalPartyModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      logo: map['logo'] as String,
      members: List<dynamic>.from((map['members'] as List<dynamic>)),
      donations: List<dynamic>.from((map['donations'] as List<dynamic>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory NewPoliticalPartyModel.fromJson(String source) => NewPoliticalPartyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
