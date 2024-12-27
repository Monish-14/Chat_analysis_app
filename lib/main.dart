import 'package:flutter/material.dart';
import 'package:chat_app_with_data_analysis/Pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        hintColor: Colors.white,
        textTheme: TextTheme(
            bodyMedium: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            bodySmall: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            bodyLarge: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
