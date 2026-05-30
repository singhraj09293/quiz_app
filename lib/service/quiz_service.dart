import 'package:dio/dio.dart';
import 'package:quiz_app/model/quiz.dart';

class QuizService {
  Future<List<Quiz>> fetchQuiz() async {
    final dio = Dio();
    final response = await dio.get(
      'https://opentdb.com/api.php?amount=10&category=18&type=multiple',
    );
    final data = response.data['results'];
    return (data as List).map((response) => Quiz.fromJson(response)).toList();
  }
}
