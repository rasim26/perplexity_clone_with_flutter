import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perpelxity_clone/Theme/colors.dart';
import 'package:perpelxity_clone/services/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
Aravind Srinivas is the CEO and co-founder of Perplexity AI, recognized for his pioneering role in conversational artificial intelligence and answer-based search technology. Below is a detailed look at his background, accomplishments, and journey.[1][2][6][7]

### Early Life and Education

- **Birth**: June 7, 1994, Chennai (formerly Madras), India.[3][7][8]
- **Education**:
  - Graduated with dual degrees (B.Tech and M.Tech) in electrical engineering from the prestigious Indian Institute of Technology (IIT) Madras, where he was mentored by Professor Balaraman Ravindran — a leading AI researcher.[6][7][1][3]
  - Completed his PhD in computer science at the University of California, Berkeley, specializing in machine learning and artificial intelligence.[2][4][7][1][6]

### Research and Career Path

- **Research Internships**:
  - Worked at OpenAI (twice: first as a research intern, then as a research scientist), DeepMind, and Google Brain, focusing on ground-breaking work in AI, deep learning, and reinforcement learning.[4][5][7][2]
- **Key Experience**:
  - Developed advanced algorithms for language models and generative AI, researching at top global AI companies.[5][2][4]
  - Collaborated with prominent AI figures, including Yoshua Bengio.[6]

### Founding and Leading Perplexity AI

- **Foundation**: In August 2022, Srinivas co-founded Perplexity AI along with Denis Yarats, Johnny Ho, and Andy Konwinski.[7][1][3][4][6]
- **Vision**: Srinivas built Perplexity AI out of frustration with traditional search engines, aiming to create a system that delivers direct, cited, conversational answers to complex queries using cutting-edge large language models.[1][3][4]
- **Unique Approach**: The “answer engine” pioneered by Srinivas is distinguished from normal search by its ability to provide context-aware, trustworthy, and referenced answers, rather than just lists of links.[3][4][1]
- **Funding and Growth**: Under his leadership, Perplexity AI raised over \$ 165 million from major investors including Jeff Bezos, Nat Friedman, NVIDIA, and Elad Gil.[4][3]
- **Recognition**: Named by TIME Magazine as one of the "TIME100 Most Influential People in AI" and regularly in the global tech spotlight for bold moves and industry-impacting proposals, such as the offer to buy Google Chrome for \$34.5 billion.[7][6]

### Personal Impact and Philosophy

- **Influence**: Srinivas champions interdisciplinary learning and innovation, encouraging others to break out of traditional academic boundaries.[3]
- **Angel Investments**: He has also become an active angel investor in numerous AI startups since 2023, further influencing the field.[2][5]
- **Quote**: “Innovation isn’t about following a predetermined path; it’s about having the courage to forge new ones.” — Aravind Srinivas.[3]

### Summary Table: Aravind Srinivas’s Journey

| Aspect             | Details                                                                      |
|--------------------|-----------------------------------------------------------------------------|
| Birth              | June 7, 1994, Chennai, India[7][3][8]                        |
| Education          | IIT Madras (EE), UC Berkeley (PhD, CS)[1][7][6][4]       |
| Major Research     | OpenAI, DeepMind, Google Brain[5][4][2][7]               |
| Founded            | Perplexity AI (2022)[1][7][3][6][4]                 |
| Investors          | Jeff Bezos, Nat Friedman, Elad Gil, NVIDIA, Susan Wojcicki[4][3] |
| Recognition        | TIME100 Most Influential, tech press[7][6]                        |

Aravind Srinivas stands out as one of the youngest and most impactful AI entrepreneurs globally, blending technical brilliance with visionary leadership to shape the future of search and information access.[5][1][2][4][6][7][3]

[1](https://timesofindia.indiatimes.com/education/news/aravind-srinivas-educational-qualification-and-career-path-how-this-iit-madras-graduate-became-perplexity-ceo/articleshow/122793956.cms)
[2](https://www.hindustantimes.com/world-news/us-news/who-is-aravind-srinivas-indian-origin-ceo-who-challenged-elon-musk-over-usaid-101739162459316.html)
[3](https://www.frederick.ai/blog/aravind-srinivas-perplexity-ai)
[4](https://www.mwcbarcelona.com/agenda/speakers/13839-aravind-srinivas)
[5](https://www.linkedin.com/in/aravind-srinivas-16051987)
[6](https://www.indiatoday.in/technology/news/story/who-is-aravind-srinivas-the-man-who-wrote-letter-to-sundar-pichai-seeking-to-buy-google-chrome-2770703-2025-08-13)
[7](https://en.wikipedia.org/wiki/Perplexity_AI)
[8](https://starsunfolded.com/aravind-srinivas/)
[9](https://golden.com/wiki/Aravind_Srinivas-AN5XXXZ)
''';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perplexity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Skeletonizer(
          effect: ShimmerEffect(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.topRight,
            baseColor: Colors.grey.shade300,
            highlightColor: const Color.fromARGB(93, 245, 245, 245),
            duration: Duration(
              seconds: 3,
            ),
          ),
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
