import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

Widget artCardText(context, artCard) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    sliver: SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(artCard.text.replaceAll("\\n", "\n").replaceAll("\\t", "\t"),
              style: Theme.of(context).textTheme.bodyMedium),
          //const SizedBox(height: 20),
          ...artCard.source_links.map(
            (item) => Linkify(
              onOpen: (link) async {
                if (!await launchUrl(Uri.parse(link.url))) {
                  throw Exception('Could not launch ${link.url}');
                }
              },
              text: item,
              //style: TextStyle(color: Colors.yellow),
              linkStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            ' Ще картин:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ...artCard.more_art_links.map(
            (item) => Linkify(
              onOpen: (link) async {
                if (!await launchUrl(Uri.parse(link.url))) {
                  throw Exception('Could not launch ${link.url}');
                }
              },
              text: item,
              style: TextStyle(color: Colors.yellow),
              linkStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}
