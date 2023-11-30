import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/blocs/art_cards_bloc/art_cards_bloc.dart';
import 'package:flutter_course/blocs/liked_cards_bloc/liked_cards_bloc.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/data/models/repository.dart';
import 'package:flutter_course/firebase_options.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/dark_theme.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/theme.dart';
import 'package:flutter_course/presentation/widgets/app_info_page.dart';
import 'package:flutter_course/presentation/widgets/error_page.dart';
import 'package:flutter_course/presentation/widgets/feedback_page.dart';
import 'package:flutter_course/presentation/widgets/forgot_password_page.dart';
import 'package:flutter_course/presentation/widgets/grid_screen.dart';
import 'package:flutter_course/presentation/widgets/liked_card_screen.dart';
import 'package:flutter_course/presentation/widgets/login_page.dart';
import 'package:flutter_course/presentation/widgets/main_page.dart';
import 'package:flutter_course/presentation/widgets/register_page.dart';
import 'package:flutter_course/presentation/widgets/user_page.dart';
import 'package:go_router/go_router.dart';

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
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ArtCardsBloc>(
          create: (context) => ArtCardsBloc(
            repository: Repository(),
          ),
        ),
        BlocProvider<LikedCardsBloc>(
          create: (context) => LikedCardsBloc(
            repository: Repository(),
          ),
        ),
      ],
      child: const App(),
    ),
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

  onThemeModeSwitch(mode) {
    setState(() {
      themeModeCustom = mode;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) =>
              MainPage(onThemeModeSwitch: onThemeModeSwitch),
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser == null) {
              return "/login";
            }
            return null;
          },
          routes: [
            GoRoute(
              path: "settings",
              builder: (context, state) => const UserPage(),
            ),
            GoRoute(
              path: "feedback",
              builder: (context, state) => const FeedbackPage(),
            ),
            GoRoute(
              path: "info",
              builder: (context, state) => const AppInfoPage(),
            ),
            GoRoute(
              path: "liked_list",
              builder: (context, state) => const GridScreen(),
              routes: [
                GoRoute(
                    path: "liked_card",
                    builder: (context, state) =>
                        LikedCard(card: state.extra as ArtCard)),
              ],
            ),
          ],
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: "forgot_password",
              builder: (context, state) => const ForgotPasswordPage(),
            ),
          ],
        ),
        GoRoute(
          path: "/register",
          builder: (context, state) => const RegisterPage(),
        ),
      ],
      errorBuilder: (context, state) => const ErrorPage(),
    );

    return MaterialApp.router(
      routerConfig: router,
      title: "Go router",
      themeMode: themeModeCustom,
      darkTheme: myDarkTheme(),
      theme: myTheme(),
    );
  }
}
