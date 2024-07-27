import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CollectionModel {
  final String id;
  final String name;
  final String description;
  final List books;
  CollectionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.books,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'books': books,
    };
  }

  factory CollectionModel.fromMap(Map<String, dynamic> map) {
    return CollectionModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      books: List.from((map['books'] as List),
    ),);
  }

  String toJson() => json.encode(toMap());

  factory CollectionModel.fromJson(String source) => CollectionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
