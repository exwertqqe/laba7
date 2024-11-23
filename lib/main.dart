import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Змінні для налаштування розміру контейнера та радіусу
  double _width = 100.0, _height = 100.0, _topRightRadius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Створюємо слайдери для кожного параметра
            _buildSliderRow("Width", _width, 50, 300, (value) => setState(() => _width = value)),
            _buildSliderRow("Height", _height, 50, 300, (value) => setState(() => _height = value)),
            _buildSliderRow("Top Right Radius", _topRightRadius, 0, 100, (value) => setState(() => _topRightRadius = value)),
            Container(
              // контейнер з властивостями
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(topRight: Radius.circular(_topRightRadius)),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Функція для побудови слайдера з текстом та слайдером
  Widget _buildSliderRow(String label, double value, double min, double max, Function(double) onChanged) {
    return Row(
      children: [
        Text("$label: "), // Назва параметра
        Text(value.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold)), // Значення параметра
        Slider(value: value, min: min, max: max, onChanged: onChanged), // Слайдер для зміни значення
      ],
    );
  }
}
