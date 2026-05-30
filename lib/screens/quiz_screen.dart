
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/theme/mytheme.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final quizs=ref.watch(quizProvider);
    return Scaffold(
      backgroundColor: Mytheme.quizBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Mytheme.cardBg,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.emoji_events_outlined,color: Mytheme.pointsGold,),
                        SizedBox(width: 10,),
                        Text('120 pts',style: TextStyle(
                          color: Mytheme.pointsGold
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Mytheme.cardBg,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer_outlined,color: Mytheme.timerGreen,),
                        SizedBox(width: 10,),
                        Text('0:30',style: TextStyle(
                          color: Mytheme.timerGreen
                        ),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height:12),
              LinearProgressIndicator(
                value:quizs.currentIndex/quizs.question.length,
                backgroundColor: Mytheme.optionUnselected,
                color: Mytheme.progressActive,
                minHeight: 10,
                borderRadius: BorderRadius.circular(30),
              )
            ],
          ),
        ),
      ),
    );
  }
}