import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentValue = 0; // Valor inicial en 0
  final int _targetValue = 40; // Número ganador
  bool _gameWon = false; // Variable para controlar si el juego se ha ganado

  String _feedbackMessage() {
    if (_gameWon) {
      return '¡Ganaste!'; // Mostrar solo si el juego ya se ha ganado
    } else if (_currentValue < _targetValue) {
      if (_currentValue >= 30) {
        return 'Caliente';
      } else {
        return 'Frío';
      }
    } else {
      if (_currentValue <= 50) {
        return 'Frío';
      } else if (_currentValue <= 90) {
        return 'Muy frío';
      } else {
        return 'Demasiado frío';
      }
    }
  }

  void _onSliderChanged(double newValue) {
    setState(() {
      _currentValue = newValue.toInt();
      if (_currentValue == _targetValue) {
        _gameWon = true;
      }
    });
  }

  void _restartGame() {
    setState(() {
      _currentValue = 0; // Reiniciamos el valor inicial a 0
      _gameWon = false; // Reiniciamos el estado del juego
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Fondo azul
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12, // Sombra ligera
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Adivina el número",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color del texto
                ),
              ),
              Slider(
                value: _currentValue.toDouble(),
                min: 0.0,
                max: 100.0,
                divisions: 100,
                label: _currentValue.toString(),
                activeColor: Colors.deepPurple,
                inactiveColor: Colors.deepPurple.shade100,
                onChanged: _gameWon ? null : _onSliderChanged,
              ),
              Text(
                'Valor actual: $_currentValue',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Color del texto
                ),
              ),
              Text(
                _feedbackMessage(),
                style: TextStyle(
                  fontSize: 22,
                  color: _gameWon ? Colors.green : Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (_gameWon)
                ElevatedButton(
                  onPressed: _restartGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 88, 211, 205),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('¿Deseas reiniciar el juego?'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
