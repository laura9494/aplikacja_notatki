import 'package:flutter/material.dart';
import 'home_screen.dart';


const Color customColor = Color(0xFF42A5F5); 

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
        scaffoldBackgroundColor: customColor, 
      ),
    );
  }
}


