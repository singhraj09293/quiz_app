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

factory Quiz.fromJson(Map<String, dynamic> json) {
  return Quiz(
    question: json['question'] as String,
    correctAnswer: json['correct_answer'] as String,
    incorrectAnswers: List<String>.from(json['incorrect_answers']),
    difficult: json['difficulty'] as String,
    category: json['category'] as String,
  );
}

  String toJson() => json.encode(toMap());

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
