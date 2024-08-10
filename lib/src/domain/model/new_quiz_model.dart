import 'dart:convert';

// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

QuizResponse quizResponseFromJson(String str) => QuizResponse.fromJson(json.decode(str));

String quizResponseToJson(QuizResponse data) => json.encode(data.toJson());

class QuizResponse {
  QuizResponse({
    required this.data,
    required this.message,
  });

  List<Quiz> data;
  String message;

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        data: List<Quiz>.from(json["data"].map((x) => Quiz.fromJson(x))),
        message: json["message"] ?? "Success",
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
    required this.v,
  });

  String id;
  String title;
  String description;
  List<Question> questions;
  int v;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "__v": v,
      };
}

class Question {
  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    required this.v,
  });

  String id;
  String text;
  List<String> options;
  int correctOptionIndex;
  int v;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["_id"],
        text: json["text"],
        options: List<String>.from(json["options"].map((x) => x)),
        correctOptionIndex: json["correctOptionIndex"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "options": List<dynamic>.from(options.map((x) => x)),
        "correctOptionIndex": correctOptionIndex,
        "__v": v,
      };
}
