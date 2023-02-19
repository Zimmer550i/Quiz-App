import 'package:flutter/material.dart';
import 'package:quizapp/models/questions.dart';

class QuestionWidget extends StatelessWidget {
  final Questions questions;
  const QuestionWidget({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Details Part
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Text("Catagory: ${questions.category}"),
              Flexible(child: Container()),
              Text("Difficulty: ${questions.difficulty}"),
            ],
          ),
        ),

        //Question Part
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              questions.question,
              style: questions.question.length < 50
                  ? Theme.of(context).textTheme.headlineLarge
                  : Theme.of(context).textTheme.headlineSmall,
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}
