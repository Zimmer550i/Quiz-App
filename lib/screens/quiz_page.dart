import 'package:flutter/material.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/screens/end_page.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/widgets/choices.dart';
import 'package:quizapp/widgets/question_widget.dart';

class QuizPage extends StatefulWidget {
  final List<Questions> questions;
  final int questionsCount;
  const QuizPage(
      {super.key, required this.questions, required this.questionsCount});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNo = 0;
  int point = 0;
  int? selected;
  bool? isCorrect;
  bool isLoaded = false;
  List<String> choices = List<String>.filled(0, "", growable: true);

  @override
  Widget build(BuildContext context) {
    if (isLoaded==false) {
      //List Creation
      choices = List<String>.filled(0, "", growable: true);
      choices.add(widget.questions[questionNo].incorrectAnswers[0]);
      choices.add(widget.questions[questionNo].incorrectAnswers[1]);
      choices.add(widget.questions[questionNo].incorrectAnswers[2]);
      choices.add(widget.questions[questionNo].correctAnswer);
      choices.shuffle();

      isLoaded = true;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBG,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Container(),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Question ${questionNo + 1}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    "Points $point",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: LinearProgressIndicator(
                value: questionNo / (widget.questionsCount - 1),
                minHeight: 10,
              ),
            ),
        
            QuestionWidget(
              questions: widget.questions[questionNo],
            ),
        
            //Option 1
            InkWell(
              onTap: () {
                setState(() {
                  selected = 0;
                });
              },
              child: ChoiceWidget(
                str: choices[0],
                isSelected: selected == 0 ? true : false,
                isCorrect: isCorrect,
              ),
            ),
        
            //Option 2
            InkWell(
              onTap: () {
                setState(() {
                  selected = 1;
                });
              },
              child: ChoiceWidget(
                str: choices[1],
                isSelected: selected == 1 ? true : false,
                isCorrect: isCorrect,
              ),
            ),
        
            //Option 3
            InkWell(
              onTap: () {
                setState(() {
                  selected = 2;
                });
              },
              child: ChoiceWidget(
                str: choices[2],
                isSelected: selected == 2 ? true : false,
                isCorrect: isCorrect,
              ),
            ),
        
            //Option 4
            InkWell(
              onTap: () {
                setState(() {
                  selected = 3;
                });
              },
              child: ChoiceWidget(
                str: choices[3],
                isSelected: selected == 3 ? true : false,
                isCorrect: isCorrect,
              ),
            ),
        
            InkWell(
              onTap: () async {
                if (selected != null) {
                  setState(() {
                    if (widget.questions[questionNo].correctAnswer ==
                        choices[selected!]) {
                      isCorrect = true;
                      point += 1;
                    } else {
                      isCorrect = false;
                    }
                    // selected = null;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    isCorrect = null;
                    selected = null;
                    isLoaded = false;
                    if (questionNo < widget.questionsCount - 1) {
                      questionNo += 1;
                    }else{
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => EndPage(point: point),),);
                    }
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Check",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
        
            Flexible(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
