import 'package:flutter/material.dart';

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
      title: 'Day 2 of building a flutter project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 19, 114, 246)),
        useMaterial3: true,
      ),
    );
  }
}
