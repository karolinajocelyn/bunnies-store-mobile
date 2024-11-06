import 'package:flutter/material.dart';
import 'package:bunnies_store/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bunnies Store',
      theme: ThemeData(
        // Define a pastel pink primary color for a galaxy look.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          primary: Color(0xFFEFB2CC), // Soft pastel pink
          secondary: Color(0xFFDBC3E6), // Light pastel lavender as accent
        ),
        scaffoldBackgroundColor: Colors.white, // Light pastel background
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
