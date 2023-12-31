import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/data/models/repository.dart';
import 'package:flutter_course/presentation/widgets/card_screen.dart';
import 'package:flutter_course/presentation/widgets/login_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.onThemeModeSwitch});

  final Function onThemeModeSwitch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RepositoryProvider(
              create: (context) => Repository(),
              child: Home(onThemeModeSwitch: onThemeModeSwitch),
            );
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, required this.onThemeModeSwitch});
  final Function onThemeModeSwitch;
  @override
  Widget build(BuildContext context) {
    return CardScreen(onThemeModeSwitch: onThemeModeSwitch);
  }
}
