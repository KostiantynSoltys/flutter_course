import 'package:flutter/material.dart';

Widget artCardText(context, artCard) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    sliver: SliverToBoxAdapter(
      child: Column(
        children: [
          Text(artCard.text.replaceAll("\\n", "\n").replaceAll("\\t", "\t"),
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 25)
        ],
      ),
    ),
  );
}
