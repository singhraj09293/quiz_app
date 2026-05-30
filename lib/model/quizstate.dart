// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quiz_app/model/quiz.dart';

class QuizState {
  final List<Quiz> question;
  final int currentIndex;
  final int score;
  final int incorrect;
  final bool isAnswered;

  QuizState(
    this.question,
    this.currentIndex,
    this.score,
    this.incorrect,
    this.isAnswered,
  );

  QuizState copyWith({
    List<Quiz>? question,
    int? currentIndex,
    int? score,
    int? incorrect,
    bool? isAnswered,
  }) {
    return QuizState(
      question ?? this.question,
      currentIndex ?? this.currentIndex,
      score ?? this.score,
      incorrect ?? this.incorrect,
      isAnswered ?? this.isAnswered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question.map((x) => x.toMap()).toList(),
      'currentIndex': currentIndex,
      'score': score,
      'incorrect': incorrect,
      'isAnswered': isAnswered,
    };
  }

  factory QuizState.fromMap(Map<String, dynamic> map) {
    return QuizState(
      List<Quiz>.from((map['question'] as List<int>).map<Quiz>((x) => Quiz.fromMap(x as Map<String,dynamic>),),),
      map['currentIndex'] as int,
      map['score'] as int,
      map['incorrect'] as int,
      map['isAnswered'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizState.fromJson(String source) => QuizState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuizState(question: $question, currentIndex: $currentIndex, score: $score, incorrect: $incorrect, isAnswered: $isAnswered)';
  }

  @override
  bool operator ==(covariant QuizState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.question, question) &&
      other.currentIndex == currentIndex &&
      other.score == score &&
      other.incorrect == incorrect &&
      other.isAnswered == isAnswered;
  }

  @override
  int get hashCode {
    return question.hashCode ^
      currentIndex.hashCode ^
      score.hashCode ^
      incorrect.hashCode ^
      isAnswered.hashCode;
  }
}
