import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'theme_switch_button.dart';
import 'package:flutter_course/presentation/widgets/app_info_page.dart';
import 'package:flutter_course/presentation/widgets/feedback_page.dart';
import 'package:flutter_course/presentation/widgets/grid_screen.dart';
import 'package:flutter_course/presentation/widgets/user_page.dart';

Widget bottomSheet(context, widget) {
  return IconButton(
    icon: const Icon(Icons.person),
    iconSize: 30,
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 280,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GridScreen(
                                onThemeModeSwitch: widget.onThemeModeSwitch),
                          ),
                        );
                      },
                      child: const Text('Вподобане'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedbackPage(),
                          ),
                        );
                      },
                      child: const Text('Ваш хід'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserPage(),
                                ),
                              );
                            },
                            child: const Text('Про вас'),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AppInfoPage(),
                                ),
                              );
                            },
                            child: const Text('Про нас'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    themeSwitch(context, widget),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
