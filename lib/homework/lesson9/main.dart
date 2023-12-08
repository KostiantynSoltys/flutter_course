import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/homework/lesson9/bloc/paintings_bloc.dart';
import 'package:flutter_course/homework/lesson9/data/network_client.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'dark_theme.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'theme.dart';

void main() {
  runApp(
    const App(),
  );
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

  onLanguageSwitch(lang) {
    setState(() {
      locale = lang;
    });
  }

  onThemeModeSwitch(mode) {
    setState(() {
      themeModeCustom = mode;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaintingsBloc(
        networkCLient: NetworkCLient(),
      ),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('uk'), // Ukrainian
        ],
        themeMode: themeModeCustom,
        darkTheme: myDarkTheme(),
        theme: myTheme(),
        locale: locale,
        home: MainScreen(
            onLanguageSwitch: onLanguageSwitch,
            onThemeModeSwitch: onThemeModeSwitch),
      ),
    );
  }
}
