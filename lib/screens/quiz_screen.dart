import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/screens/result.dart';
import 'package:quiz_app/theme/mytheme.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  bool _dialogShown = false;
  String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    final quizs = ref.watch(quizProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Mytheme.quizBg,
      body: quizs.when(
        data: (value) {
          if (value.question.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: Mytheme.progressActive),
            );
          }
          final time = ref.watch(timeProvider);
          final options = [
            ...value.question[value.currentIndex].incorrectAnswers,
            value.question[value.currentIndex].correctAnswer,
          ];
          if (!_dialogShown) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _dialogShown = true;
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: Mytheme.cardBg,
                  title: Text(
                    'Are you ready to crash your brain',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('No', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ref.read(timeProvider.notifier).startTimer();
                      },
                      child: Text('Yes', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );
            });
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Mytheme.cardBg,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              color: Mytheme.pointsGold,
                            ),
                            Text(
                              '${value.score} pts',
                              style: TextStyle(color: Mytheme.pointsGold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Mytheme.cardBg,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Mytheme.timerGreen,
                            ),
                            Text(
                              '$time sec',
                              style: TextStyle(color: Mytheme.timerGreen),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(20),
                    value: value.currentIndex / value.question.length,
                    backgroundColor: Mytheme.optionUnselected,
                    color: Mytheme.progressActive,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Question ${value.currentIndex + 1} of ${value.question.length}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Mytheme.cardBg,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Mytheme.progressActive,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Mytheme.progressActive,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            value.question[value.currentIndex].category,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          textAlign: TextAlign.center,
                          value.question[value.currentIndex].question,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAnswer = options[index];
                          });
                          ref
                              .read(quizProvider.notifier)
                              .answerQuestion(options[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Mytheme.cardBg,
                            borderRadius: BorderRadius.circular(30),
                            border:
                                value.isAnswered &&
                                    (options[index] == _selectedAnswer ||
                                        options[index] ==
                                            value
                                                .question[value.currentIndex]
                                                .correctAnswer)
                                ? Border.all(
                                    color:
                                        options[index] ==
                                            value
                                                .question[value.currentIndex]
                                                .correctAnswer
                                        ? Mytheme.correctGreen
                                        : Mytheme.wrongRed,
                                  )
                                : null,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    value.isAnswered &&
                                        (value.isAnswered &&
                                            (options[index] ==
                                                    _selectedAnswer ||
                                                options[index] ==
                                                    value
                                                        .question[value
                                                            .currentIndex]
                                                        .correctAnswer))
                                    ? options[index] ==
                                              value
                                                  .question[value.currentIndex]
                                                  .correctAnswer
                                          ? Mytheme.correctGreen
                                          : Mytheme.wrongRed
                                    : Mytheme.progressActive,
                                child: Text(
                                  ['A', 'B', 'C', 'D'][index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  options[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(380, 65),
                      backgroundColor: Mytheme.progressActive,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20),
                      ),
                    ),
                    onPressed: value.isAnswered
                        ? () {
                            value.currentIndex == value.question.length - 1
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => Result()),
                                  )
                                : ref
                                      .read(quizProvider.notifier)
                                      .nextQuestion();
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next Question',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.navigate_next_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (e, st) => Text('Error $e'),
        loading: () => Scaffold(
          backgroundColor: Mytheme.quizBg,
          body: Center(
            child: CircularProgressIndicator(color: Mytheme.progressActive),
          ),
        ),
      ),
    );
  }
}
