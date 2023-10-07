import 'package:flutter/material.dart';
import 'package:fluttertask/modals/question_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.title,
    required this.onTap,
    this.item,
    super.key,
  });
  final String? title;
  final Item? item;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xFFc7f9cc).withOpacity(0.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question: $title",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text("${item!.answerCount} aswers"),
                Text(" | "),
                Text("${item!.score} Score"),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text("Question Asked By: ${item!.owner!.displayName}"),
          ],
        ),
      ),
    );
  }
}