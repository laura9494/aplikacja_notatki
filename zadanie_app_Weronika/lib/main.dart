import 'package:flutter/material.dart';
import 'home_screen.dart';

// Zdefiniowanie nowych kolorów
const Color customColor = Color(0xFF42A5F5); // Dotychczasowy kolor
const Color newBackgroundColor = Color(0xFFE1F5FE); // Nowy kolor tła

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
      theme: ThemeData(
        primaryColor: customColor, 
        scaffoldBackgroundColor: newBackgroundColor, // Zmieniamy tło
      ),
    );
  }
}



