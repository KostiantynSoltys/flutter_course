import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/dark_theme.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/theme.dart';
import 'package:flutter_course/presentation/widgets/card_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 255, 210, 63),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Locale? locale;
  ThemeMode themeModeCustom = ThemeMode.system;

  onThemeModeSwitch(mode) {
    setState(() {
      themeModeCustom = mode;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeModeCustom,
      darkTheme: myDarkTheme(),
      theme: myTheme(),
      home: CardScreen(onThemeModeSwitch: onThemeModeSwitch),
    );
  }
}
