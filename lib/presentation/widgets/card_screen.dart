import 'package:flutter/material.dart';
import 'package:flutter_course/data/cards_list.dart';
import 'package:flutter_course/presentation/widgets/bottom_sheet.dart';
//import 'package:intl/intl.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, required this.onThemeModeSwitch});

  final Function onThemeModeSwitch;

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
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:
                Theme.of(context).colorScheme.background.withOpacity(0.50),
            elevation: 0,
            pinned: true,
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
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
            ),
            actions: [
              bottomSheet(context, widget),
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
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                Text(
                  cardsList[currentCardIndex].title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(cardsList[currentCardIndex].text,
                      style: Theme.of(context).textTheme.bodyMedium),
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
