import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CivicEducationBookModel {
  final String category;
  final String name;
  final String id;
  final String coverImageUrl;
  final int pageNumber;
  final String author;
  final String type;
  final DateTime createdAt;
  final String url;
  CivicEducationBookModel({
    this.category = "Government",
    required this.name,
    required this.id,
    required this.coverImageUrl,
    required this.pageNumber,
    required this.author,
    required this.type,
    required this.createdAt,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'name': name,
      'id': id,
      'coverImageUrl': coverImageUrl,
      'pageNumber': pageNumber,
      'author': author,
      'type': type,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'url': url,
    };
  }

  factory CivicEducationBookModel.fromMap(Map<String, dynamic> map) {
    return CivicEducationBookModel(
      category:"Government",
      name: map['name'] as String,
      id: map['_id'] as String,
      coverImageUrl: map['coverImage'] as String,
      pageNumber: map['pageNumber'] as int,
      author: map['author'] as String,
      type: map['type'] as String,
      createdAt: DateTime.parse(map['created_dt'] as String),
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CivicEducationBookModel.fromJson(String source) => CivicEducationBookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  CivicEducationBookModel copyWith({
    String? category,
    String? name,
    String? id,
    String? coverImageUrl,
    int? pageNumber,
    String? author,
    String? type,
    DateTime? createdAt,
    String? url,
  }) {
    return CivicEducationBookModel(
      category: category ?? this.category,
      name: name ?? this.name,
      id: id ?? this.id,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      pageNumber: pageNumber ?? this.pageNumber,
      author: author ?? this.author,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
    );
  }
}
