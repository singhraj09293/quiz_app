import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/quizstate.dart';
import 'package:quiz_app/service/quiz_service.dart';


class QuizNotifier extends Notifier<QuizState> {

  @override
  QuizState build() {
    return QuizState([], 0, 0, 0,false);
  }

  void fetchQuiz() async {
    final question = await QuizService().fetchQuiz();
    state = state.copyWith(question: question);
  }

  void answerQuestion(String answer) {

    final quiz = state.question[state.currentIndex];
    final isCorrect = quiz.correctAnswer == answer;
    
    state=state.copyWith(
       isAnswered:true,
      score: isCorrect ? state.score + 1 : state.score,
      incorrect: isCorrect ? state.incorrect : state.incorrect + 1,
    );
  }

  void nextQuestion() {
    state = state.copyWith(
      isAnswered: false,
      currentIndex: state.currentIndex + 1);

  }

  void resetQuiz() {
    state = build();
  }
}

final quizProvider = NotifierProvider<QuizNotifier, QuizState>(
  QuizNotifier.new,
);
