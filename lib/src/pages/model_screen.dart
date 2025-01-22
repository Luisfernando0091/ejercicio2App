import 'package:ejercicio1/src/pages/home_screen.dart';
import 'package:flutter/material.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 9);
    Future.delayed(d, () {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 158, 79, 172)
            ], // Degradado de azul a morado
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Mago.png"),
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: Text(
                    "Welcome to the Game.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 173, 173, 218),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
