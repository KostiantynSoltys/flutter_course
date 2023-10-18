import 'package:flutter/material.dart';

Widget themeSwitch(context, widget) {
  return IconButton(
    icon: Icon(
      Theme.of(context).brightness == Brightness.dark
          ? Icons.nightlight_round
          : Icons.wb_sunny,
    ),
    onPressed: () {
      Theme.of(context).brightness == Brightness.dark
          ? widget.onThemeModeSwitch(ThemeMode.light)
          : widget.onThemeModeSwitch(ThemeMode.dark);
    },
  );
}
