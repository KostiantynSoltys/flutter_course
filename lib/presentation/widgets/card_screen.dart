import 'package:flutter/material.dart';
import 'package:flutter_course/data/cards_list.dart';
import 'package:flutter_course/presentation/widgets/grid_screen.dart';
//import 'package:intl/intl.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() {
    return _CardScreenState();
  }
}

class _CardScreenState extends State<CardScreen> {
  var currentCardIndex = cardsList.length - 1;
  //String todayDate = DateFormat('yMd').format(DateTime.now());

  void previousCard() {
    setState(() {
      if (currentCardIndex == 0) {
        currentCardIndex = cardsList.length - 1;
      } else {
        currentCardIndex--;
      }
    });
  }

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
            leading: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                previousCard();
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                cardsList[currentCardIndex].day,
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
                Image.asset(cardsList[currentCardIndex].image),
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
                    Text(cardsList[currentCardIndex].likesAmount,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
                Text(
                  cardsList[currentCardIndex].title,
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
                  Text(cardsList[currentCardIndex].text),
                  const SizedBox(height: 25)
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
