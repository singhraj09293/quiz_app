import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/theme/mytheme.dart';

class Result extends ConsumerWidget {
  final int score;
  final int incorrect;
  final int total;
  final String category;
  final String difficulty;
  const Result({
    super.key,
    required this.score,
    required this.incorrect,
    required this.total,
    required this.category,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // reuse previous quiz settings if needed; defaults to empty strings

    return Scaffold(
      backgroundColor: Mytheme.quizBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.emoji_events, color: Colors.amber, size: 60),
            ),
            SizedBox(height: 20),
            Text(
              'Good Job!',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              'You completed the quiz',
              style: TextStyle(color: Mytheme.progressActive, fontSize: 20),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Mytheme.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Mytheme.cardBorder, width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Score',
                    style: TextStyle(color: Mytheme.textSubtitle, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$score',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        '/',
                        style: TextStyle(
                          color: Mytheme.textSubtitle,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '$total',
                        style: TextStyle(
                          color: Mytheme.textSubtitle,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${score * 10} points Earned',
                    style: TextStyle(
                      color: Mytheme.textPointsEarned,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Mytheme.correctCardBg,
                    border: Border.all(color: Mytheme.correctAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Mytheme.correctAccent,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '$score ',
                        style: TextStyle(color: Mytheme.correctAccent),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Correct',
                        style: TextStyle(
                          color: Mytheme.correctAccent,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Mytheme.incorrectCardBg,
                    border: Border.all(color: Mytheme.incorrectAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cancel_outlined,
                        color: Mytheme.incorrectAccent,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${total - score}',
                        style: TextStyle(color: Mytheme.incorrectAccent),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Incorrect',
                        style: TextStyle(
                          color: Mytheme.incorrectAccent,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 55),
                backgroundColor: Mytheme.cardBg,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Mytheme.progressActive, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                ref.read(quizProvider.notifier).resetQuiz();
                ref.read(quizProvider.notifier).fetchQuiz(category, difficulty);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => QuizScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.replay_rounded,
                    color: Mytheme.optionTextDim,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Play Again',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 55),
                backgroundColor: Mytheme.cardBg,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Mytheme.progressActive, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                  (route) => false,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: Mytheme.optionTextDim,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Go Home',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
