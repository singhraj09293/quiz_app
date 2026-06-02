import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/theme/mytheme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String selectedCategory = '18';
String selectedDifficulty = 'medium';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff534AB7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    CupertinoIcons.lightbulb,
                    size: 50,
                    color: Color(0xff534AB7),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'CodeRush',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  'Test your Knowledge',
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade300),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 150,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Mytheme.lightPurple,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.category_outlined,
                                size: 40,
                                color: Mytheme.primaryPurple,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Category',
                                style: TextStyle(color: Mytheme.darkPurple),
                              ),
                              DropdownButton<String>(
                                value: selectedCategory,
                                items: [
                                  DropdownMenuItem(
                                    value: '18',
                                    child: Text(
                                      'Computers',
                                      style: TextStyle(
                                        color: Mytheme.darkPurple,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '17',
                                    child: Text(
                                      'Science',
                                      style: TextStyle(
                                        color: Mytheme.darkPurple,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '9',
                                    child: Text(
                                      'General',
                                      style: TextStyle(
                                        color: Mytheme.darkPurple,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: '21',
                                    child: Text(
                                      'Sports',
                                      style: TextStyle(
                                        color: Mytheme.darkPurple,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (val) {
                                  setState(() => selectedCategory = val!);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Mytheme.tealBg,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.tune,
                                size: 40,
                                color: Mytheme.tealMid,
                              ),
                              SizedBox(height: 7),
                              Text(
                                'Difficulty',
                                style: TextStyle(color: Mytheme.tealDark),
                              ),
                              DropdownButton<String>(
                                value: selectedDifficulty,
                                items: [
                                  DropdownMenuItem(
                                    value: 'easy',
                                    child: Text(
                                      'Easy',
                                      style: TextStyle(color: Mytheme.tealDark),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'medium',
                                    child: Text(
                                      'Medium',
                                      style: TextStyle(color: Mytheme.tealDark),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'hard',
                                    child: Text(
                                      'Hard',
                                      style: TextStyle(color: Mytheme.tealDark),
                                    ),
                                  ),
                                ],
                                onChanged: (val) {
                                  setState(() => selectedDifficulty = val!);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    width: 380,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '10',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'questions',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          VerticalDivider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                            width: 1,
                          ),
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1 min',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Avg time',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          VerticalDivider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                            width: 1,
                          ),
                          SizedBox(width: 30),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'option',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Mytheme.primaryPurple,
                      fixedSize: Size(370, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => QuizScreen()),
                      );
                      ref
                          .read(quizProvider.notifier)
                          .fetchQuiz(selectedCategory!, selectedDifficulty!);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Start Quiz',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
