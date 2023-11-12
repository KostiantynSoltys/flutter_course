import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/dark_theme.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/theme.dart';
import 'package:flutter_course/presentation/widgets/main_page.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 255, 210, 63),
  ),
);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance
      .activate(androidProvider: AndroidProvider.debug);
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
      // home: CardScreen(onThemeModeSwitch: onThemeModeSwitch),
      home: MainPage(onThemeModeSwitch: onThemeModeSwitch),
    );
  }
}
