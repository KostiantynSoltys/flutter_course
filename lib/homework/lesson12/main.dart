import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson12/presentation/widgets/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var tasksColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 210, 63));

var tasksDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: tasksDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: tasksDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: tasksDarkColorScheme.primaryContainer,
            foregroundColor: tasksDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: tasksDarkColorScheme.onSecondaryContainer,
                  fontSize: 18),
              titleMedium: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: tasksDarkColorScheme.onSecondaryContainer,
                  fontSize: 16),
              titleSmall: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: tasksDarkColorScheme.onSecondaryContainer,
                  fontSize: 14),
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: tasksColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: (const Color.fromARGB(255, 245, 114, 6)),
          foregroundColor: tasksColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: tasksColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: tasksColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: tasksColorScheme.onSecondaryContainer,
                  fontSize: 18),
              titleMedium: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: tasksColorScheme.onSecondaryContainer,
                  fontSize: 16),
              titleSmall: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: tasksColorScheme.onSecondaryContainer,
                  fontSize: 14),
            ),
      ),
      home: const MainScreen(),
    );
  }
}
