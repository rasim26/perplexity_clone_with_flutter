import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpelxity_clone/Theme/colors.dart';
import 'package:perpelxity_clone/screens/chat_page.dart';
import 'package:perpelxity_clone/services/chat_web_service.dart';
import 'package:perpelxity_clone/widgets/footer_mode_selector.dart';
import 'package:perpelxity_clone/widgets/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'perplexity',
          style: GoogleFonts.ibmPlexMono(
            color: AppColors.whiteColor,
            fontSize: 46,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -3,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          width: 700,
          decoration: BoxDecoration(
              color: AppColors.searchBar,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.searchBarBorder)),
          // we need only textfield here, no need of textformfield since we don't validate anything, just pass the value
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                      hintText: ' Ask anything...',
                      hintStyle: TextStyle(
                          color: AppColors.textGrey,
                          letterSpacing: 0.1,
                          fontSize: 13),
                      border: InputBorder.none),
                  scrollPadding: EdgeInsets.zero,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.abc,
                      text: 'd',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FooterModeSelector(
                          icon: Icons.view_compact_outlined,
                          popupText: 'Choose a model',
                          isSelected: false,
                          onTap: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FooterModeSelector(
                          icon: Icons.sports_basketball_outlined,
                          popupText: 'Set sources for search',
                          isSelected: false,
                          onTap: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FooterModeSelector(
                          icon: Icons.attach_file_rounded,
                          popupText: 'Attach files',
                          isSelected: false,
                          onTap: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FooterModeSelector(
                        icon: Icons.mic,
                        popupText: 'Dictation',
                        isSelected: false,
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.all(5),
                    ),
                    GestureDetector(
                      onTap: () {
                        ChatWebService().chat(queryController.text.trim());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              question: queryController.text.trim(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
