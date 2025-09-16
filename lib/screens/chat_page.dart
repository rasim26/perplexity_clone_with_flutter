import 'package:flutter/material.dart';
import 'package:perpelxity_clone/Theme/colors.dart';
import 'package:perpelxity_clone/widgets/answer_section.dart';
import 'package:perpelxity_clone/widgets/side_nav_bar.dart';
import 'package:perpelxity_clone/widgets/source_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({
    super.key,
    required this.question,
  });

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavBar(),
          const SizedBox(
            width: 100,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    //sources
                    SourceSection(),
                    SizedBox(
                      height: 24,
                    ),
                    //answer section
                    AnswerSection()
                  ],
                ),
              ),
            ),
          ),
          Placeholder(
            strokeWidth: 0,
            color: AppColors.background,
          )
        ],
      ),
    );
  }
}
