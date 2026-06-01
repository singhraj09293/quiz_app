import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/quizstate.dart';
import 'package:quiz_app/service/quiz_service.dart';

class QuizNotifier extends AsyncNotifier<QuizState> {
  @override
  Future<QuizState> build() async {
    return QuizState([], 0, 0, 0, false);
  }

  Future<void> fetchQuiz() async {
    final question = await QuizService().fetchQuiz();
    state = AsyncData(QuizState(question, 0, 0, 0, false));
  }

  void answerQuestion(String answer) {
    final quiz = state.value!.question[state.value!.currentIndex];
    final isCorrect = quiz.correctAnswer == answer;

    state = AsyncData(
      state.value!.copyWith(
        isAnswered: true,
        score: isCorrect ? state.value!.score + 1 : state.value!.score,
        incorrect: isCorrect
            ? state.value!.incorrect
            : state.value!.incorrect + 1,
      ),
    );
  }

  void nextQuestion() {
    state = AsyncData(
      state.value!.copyWith(
        isAnswered: false,
        currentIndex: state.value!.currentIndex + 1,
      ),
    );
  }

  void resetQuiz() {
    state = AsyncData(QuizState([], 0, 0, 0, false));
  }
}

class TimeNotifier extends Notifier<int> {
  bool isRunning = false;
  @override
  int build() {
    return 30;
  }

  void startTimer() {
    if (isRunning) return;
    isRunning = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state == 0) {
        timer.cancel();
      } else {
        state--;
      }
    });
  }

  void restartQuiz() {
    state = 30;
  }
}

final quizProvider = AsyncNotifierProvider<QuizNotifier, QuizState>(
  QuizNotifier.new,
);
final timeProvider = NotifierProvider<TimeNotifier, int>(TimeNotifier.new);
