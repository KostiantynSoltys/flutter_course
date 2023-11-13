import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/art_card.dart';

class LikedCard extends StatelessWidget {
  const LikedCard({super.key, required this.card});
  final ArtCard card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:
                Theme.of(context).colorScheme.background.withOpacity(0.50),
            pinned: true,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                card.day,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
            ),
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
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                Text(
                  card.title,
                  style: Theme.of(context).textTheme.bodyLarge,
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
                  Text(card.text,
                      style: Theme.of(context).textTheme.bodyMedium),
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
