import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/layouts/tabs_screen.dart';


void main() {
  runApp(
      ProviderScope(child: const MyApp())
  );
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
      home: TabsScreen(),
    );
  }
}
