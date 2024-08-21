import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Mda {
  final String id;
  final String ministryName;
  final String ministerName;
  final String ministryLogo;
  final String ministryImage;
  final String ministryDescription;
  final List? complains;
  Mda(
  {
    required this.id,
    required this.ministryName,
    required this.ministerName,
    required this.ministryLogo,
    required this.ministryImage,
    required this.ministryDescription,
    required this.complains ,
    
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ministryName': ministryName,
      'ministerName': ministerName,
      'ministryLogo': ministryLogo,
      'ministryImage': ministryImage,
      'ministryDescription': ministryDescription,
    };
  }

  factory Mda.fromMap(Map<String, dynamic> map) {
    return Mda(
      id: map['_id'] as String,
      ministryName: map['ministry_name'] as String,
      ministerName: map['minister_name'] as String,
      ministryLogo: map['ministry_logo'] as String,
      ministryImage: map['ministry_image'] as String,
      ministryDescription: map['ministry_description'] as String,
      complains: map['complains']?? [] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mda.fromJson(String source) =>
      Mda.fromMap(json.decode(source) as Map<String, dynamic>);
}
