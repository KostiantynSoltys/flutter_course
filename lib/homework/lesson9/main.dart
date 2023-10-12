import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/main_screen.dart';

void main() {
  runApp(const App(),);
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MainScreen(),
    );
  }
}