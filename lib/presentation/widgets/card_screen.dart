import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/blocs/art_cards_bloc/art_cards_bloc.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/presentation/widgets/art_card_image.dart';
import 'package:flutter_course/presentation/widgets/art_card_text.dart';
import 'package:flutter_course/presentation/widgets/bottom_sheet.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key, required this.onThemeModeSwitch});

  final Function onThemeModeSwitch;

  @override
  State<CardScreen> createState() {
    return _CardScreenState();
  }
}

class _CardScreenState extends State<CardScreen> {
  int currentCardIndex = 0;

  List<ArtCard> artCardsList = [];

  void previousCard(length) {
    setState(() {
      currentCardIndex++;
    });
  }

  void nextCard(length) {
    setState(() {
      currentCardIndex--;
    });
  }

  @override
  void initState() {
    BlocProvider.of<ArtCardsBloc>(context).add(LoadArtCards());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ArtCardsBloc artCardBloc = BlocProvider.of<ArtCardsBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: BlocBuilder<ArtCardsBloc, ArtCardsState>(
        builder: (context, state) {
          if (state is ArtCardsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ArtCardsLoaded) {
            final artCardsList = state.artCards;
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(0.50),
                  elevation: 0,
                  pinned: true,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        if (currentCardIndex != artCardsList.length - 1)
                          IconButton(
                            iconSize: 25,
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              previousCard(artCardsList.length);
                            },
                          ),
                      ],
                    ),
                  ),
                  actions: [
                    bottomSheet(context, widget),
                    if (currentCardIndex != 0)
                      IconButton(
                        iconSize: 25,
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          nextCard(artCardsList.length);
                        },
                      )
                  ],
                ),
                artCardImage(context, artCardsList[currentCardIndex], false),
                artCardText(context, artCardsList[currentCardIndex]),
              ],
              controller: ScrollController(),
            );
          } else if (state is ArtCardsOperationSuccess) {
            artCardBloc.add(
              LoadArtCards(),
            );
            return Container();
          } else if (state is ArtCardsError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
