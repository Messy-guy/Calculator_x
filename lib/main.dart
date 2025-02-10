import 'package:calculator_x/screen/calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         appBarTheme: AppBarTheme(
           backgroundColor: Color(0xFF2D2D2D), // Dark Gray but not pure black
           foregroundColor: Color(0xFFDADADA), // Light Grayish White for text/icons
           elevation: 2, // Slight shadow
         ),
       ),
       home: Calculator(),
    );
  }
}

