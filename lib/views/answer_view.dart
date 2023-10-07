import 'package:flutter/material.dart';
import 'package:fluttertask/modals/question_model.dart';

class AnswerView extends StatelessWidget {
  AnswerView({super.key, required this.arguments});
  Item arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFc7f9cc).withOpacity(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Question: ${arguments.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("Tags:"),
                Wrap(
                  children: arguments.tags!.map((item) {
                    return Container(
                      margin: EdgeInsets.only(left: 4, right: 4, top: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.black45),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 9,
                ),
                Text("Viewed By: ${arguments.viewCount}"),
                SizedBox(
                  height: 9,
                ),
                Text("Answer: ${arguments.answerCount}"),
                SizedBox(
                  height: 9,
                ),
                Text("Score: ${arguments.score}"),
                SizedBox(
                  height: 12,
                ),
                Text("Asked By:"),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Image.network(
                      "${arguments.owner!.profileImage}",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text("${arguments.owner!.displayName}"),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
