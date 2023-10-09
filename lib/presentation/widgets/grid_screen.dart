import 'package:flutter/material.dart';
import 'package:flutter_course/data/cards_list.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/presentation/widgets/card_screen.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 175, 16),
        title: const Text('Вподобане'),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CardScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: cardsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedCard(card: cardsList[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(cardsList[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LikedCard extends StatelessWidget {
  const LikedCard({super.key, required this.card});

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
                      builder: (context) => const GridScreen(),
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
