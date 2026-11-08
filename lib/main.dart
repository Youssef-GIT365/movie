import 'package:flutter/material.dart';
import 'package:movie/core/services/services_loctor.dart';
import 'package:movie/movies/presentation/screens/movie_detail_screen.dart';
import 'package:movie/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLoctor().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: MainMoviesScreen(),
    );
  }
}
