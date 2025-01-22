import 'package:ejercicio1/src/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'src/pages/model_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "model",
      routes: {
        "model": (context) => const ModelScreen(),
        "Home": (context) => const HomeScreen(),
      },
    );
  }
}
