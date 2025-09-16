import 'package:flutter/material.dart';
import 'package:perpelxity_clone/Theme/colors.dart';
import 'package:perpelxity_clone/services/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourceSection extends StatefulWidget {
  const SourceSection({super.key});

  @override
  State<SourceSection> createState() => _SourceSectionState();
}

class _SourceSectionState extends State<SourceSection> {
  bool isLoading = true;
  List searchResults = [
    {
      'title': 'Perplexity AI — Wikipedia',
      'url': 'https://en.wikipedia.org/wiki/Perplexity_AI',
    },
    {
      'title': 'Perplexity Co‑founder AMA (Reddit)',
      'url':
          'https://www.reddit.com/r/perplexity_ai/comments/1jv9hvm/ama_with_perplexity_cofounder_and_ceo_aravind/',
    },
    {
      'title': 'Perplexity — Founding Story (Contrary Research)',
      'url': 'https://research.contrary.com/company/perplexity',
    },
  ];

  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        searchResults = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.auto_awesome,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Answer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            duration: Duration(
              seconds: 2,
            ),
          ),
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: searchResults.map((res) {
              return Container(
                width: 150,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      res['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      res['url'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
