import 'package:flutter/material.dart';
import 'package:tmdb_app/screens/home_screen.dart';
import 'package:tmdb_app/screens/now_playing_screen.dart';
import 'package:tmdb_app/screens/persons_screen.dart';
import 'package:tmdb_app/screens/top_rated_screen.dart';
import 'package:tmdb_app/screens/upcoming_movie_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}