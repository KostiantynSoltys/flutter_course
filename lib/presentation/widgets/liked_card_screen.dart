import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/presentation/widgets/art_card_image.dart';
import 'package:flutter_course/presentation/widgets/art_card_text.dart';

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
            elevation: 0,
            pinned: true,
          ),
          artCardImage(context, card, true),
          artCardText(context, card),
        ],
        controller: ScrollController(),
      ),
    );
  }
}
