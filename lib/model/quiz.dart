// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Quiz {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final String difficult;
  final String category;

  Quiz({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.difficult,
    required this.category,
  });

  Quiz copyWith({
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
    String? difficult,
    String? category,
  }) {
    return Quiz(
      question: question ?? this.question,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      difficult: difficult ?? this.difficult,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'correctAnswer': correctAnswer,
      'incorrectAnswers': incorrectAnswers,
      'difficult': difficult,
      'category': category,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      question: map['question'] as String,
      correctAnswer: map['correctAnswer'] as String,
      incorrectAnswers: List<String>.from(
        map['incorrectAnswers'] as List<dynamic>,
      ),
      difficult: map['difficult'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quiz(question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers, difficult: $difficult, category: $category)';
  }

  @override
  bool operator ==(covariant Quiz other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        other.correctAnswer == correctAnswer &&
        listEquals(other.incorrectAnswers, incorrectAnswers) &&
        other.difficult == difficult &&
        other.category == category;
  }

  @override
  int get hashCode {
    return question.hashCode ^
        correctAnswer.hashCode ^
        incorrectAnswers.hashCode ^
        difficult.hashCode ^
        category.hashCode;
  }
}
