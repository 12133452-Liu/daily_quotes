import 'package:flutter/material.dart';


const List<String> quotes = [
  "The scariest moment is always just before you start.",
  "The secret of getting ahead is getting started.",
  "Your only limit is your mind.",
  "Do the best you can until you know better. Then when you know better, do better.",
  "Do what is right, not what is easy nor what is popular.",
  "Pursue what catches your heart, not what catches your eyes.",
  "Success is not how high you have climbed, but how you make a positive difference to the world."
];

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _showNextQuote(){
    setState(() {
      _currentIndex = (_currentIndex + 1) % quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quotes[_currentIndex],
                textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _showNextQuote,
            child: const Text("Next Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


