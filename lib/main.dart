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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            quotes[0],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


