import 'package:app_generator_cartel1/widgets/cartel_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "App Generator Cartel",
      debugShowCheckedModeBanner: false,
      home: CartelAppWidget()
    );
  }
}
