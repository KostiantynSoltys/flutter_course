import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'theme_switch_button.dart';
import 'package:go_router/go_router.dart';

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
                        context.go("/liked_list");
                        Navigator.pop(context);
                      },
                      child: const Text('Вподобане'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        context.go("/feedback");
                        Navigator.pop(context);
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
                              context.go("/settings");
                              Navigator.pop(context);
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
                              context.go("/info");
                              Navigator.pop(context);
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
