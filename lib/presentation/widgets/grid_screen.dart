import 'package:flutter/material.dart';
import 'package:flutter_course/data/cards_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key, required this.onThemeModeSwitch});
  final Function onThemeModeSwitch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.50),
        title: const Text('Вподобане'),
        centerTitle: true,
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: cardsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                context.go("/liked_list/liked_card", extra: cardsList[index]),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(cardsList[index].image),
            ),
          );
        },
      ),
    );
  }
}