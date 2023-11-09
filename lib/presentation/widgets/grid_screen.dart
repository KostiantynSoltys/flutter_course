import 'package:flutter/material.dart';
import 'package:flutter_course/data/cards_list.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/presentation/widgets/card_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key, required this.onThemeModeSwitch});
  final Function onThemeModeSwitch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.50),
        title: const Text('Вподобане'),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CardScreen(onThemeModeSwitch: onThemeModeSwitch),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: cardsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedCard(
                      card: cardsList[index],
                      onThemeModeSwitch: onThemeModeSwitch),
                ),
              );
            },
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

class LikedCard extends StatelessWidget {
  const LikedCard(
      {super.key, required this.card, required this.onThemeModeSwitch});

  final Function onThemeModeSwitch;
  final ArtCard card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 255, 175, 16),
            pinned: false,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                card.day,
                style: const TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            actions: [
              IconButton(
                iconSize: 35,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GridScreen(onThemeModeSwitch: onThemeModeSwitch),
                    ),
                  );
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Image.asset(card.image),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.thumb_up_off_alt_outlined),
                      onPressed: () {
                        // ...
                      },
                    ),
                    const SizedBox(width: 220),
                    Text(card.likesAmount,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                Text(
                  card.title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(card.text),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
        controller: ScrollController(),
      ),
    );
  }
}
