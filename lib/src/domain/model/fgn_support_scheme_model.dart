import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FgnSupportSchemeModel {
  String id;
  String title;
  String acronym;
  bool isFavorite;
  String url;
  String body;
  FgnSupportSchemeModel({
    required this.id,
    required this.title,
    required this.acronym,
    this.isFavorite = false,
    required this.url,
    required this.body,
  });

  factory FgnSupportSchemeModel.forTest() {
    return FgnSupportSchemeModel(
        id:"66794bd29adeedc1ebf2947b",
        title: "Agricultural Credit Guarantee Scheme Fund",
        acronym: "ACGSF",
        isFavorite: false,
        url:
            "https://upload.wikimedia.org/wikipedia/commons/4/48/Nigeria_Federal_Ministry_of_Health_Logo.png",
        body:
            "Lorem ipsum dolor sit amet consectetur. Vitae semper nisi libero aliquet fames sit eu mi turpis. Neque commodo ut turpis eros ac felis. Semper volutpat donec risus vestibulum dignissim magna. Magna eleifend rhoncus mattis convallis risus. Elementum laoreet nulla tempus fringilla cras. Eget arcu massa eget lorem eget quisque fa, Lorem ipsum dolor sit amet consectetur. Vitae semper nisi libero aliquet fames sit eu mi turpis. Neque commodo ut turpis eros ac felis. Semper volutpat donec risus vestibulum dignissim magna. Magna eleifend rhoncus mattis convallis risus. Elementum laoreet nulla tempus fringilla cras. Eget arcu massa eget lorem eget quisque fa");
  }

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'acronym': acronym,
      'isFavorite': isFavorite,
      'url': url,
      'body': body,
    };
  }

  factory FgnSupportSchemeModel.fromMap(Map<String, dynamic> map) {
    return FgnSupportSchemeModel(
      id: map['_id'] as String,
      title: map['title'] as String,
      acronym: map['acronym'] ?? "ACGSF" ,
      isFavorite: map['isFavorite'] ?? false ,
      url: map['url'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FgnSupportSchemeModel.fromJson(String source) => FgnSupportSchemeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
