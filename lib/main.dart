import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'layouts/home_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 132, 0, 51),
            brightness: Brightness.dark
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme()
      ),
      home: const HomeScreen(),
    );
  }
}
