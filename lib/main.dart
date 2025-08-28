import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpelxity_clone/Theme/colors.dart';
import 'package:perpelxity_clone/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This is a web-based project.
  // a web-application just like perplexity, ie, displaying information with sources.
  // using gemini ai (experimental) or llama ai.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 2 of building a flutter project',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.submitButton,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: HomeScreen(),
    );
  }
}
