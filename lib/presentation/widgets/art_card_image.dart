import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/blocs/art_cards_bloc/art_cards_bloc.dart';
import 'package:flutter_course/data/models/repository.dart';
import 'package:flutter_course/presentation/widgets/grid_screen.dart';
import 'package:flutter_course/presentation/widgets/like_button.dart';

Widget artCardImage(context, artCard, isLikedList) {
  Future<String?> image = Repository().getImage(artCard.image);
  String? email = Repository().userEmail();
  final ArtCardsBloc artCardBloc = BlocProvider.of<ArtCardsBloc>(context);
  return SliverToBoxAdapter(
    child: Column(
      children: [
        FutureBuilder(
          future: image,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.network(snapshot.data!);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Container();
          },
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              if (artCard.likes.contains(email) && isLikedList == false)
                LikeButton(
                    isLiked: true,
                    onTap: () {
                      artCardBloc.add(
                        UnlikeCard(artCard.id),
                      );
                    })
              else if (artCard.likes.contains(email) && isLikedList == true)
                LikeButton(
                  isLiked: true,
                  onTap: () {
                    artCardBloc.add(
                      UnlikeCard(artCard.id),
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GridScreen(),
                      ),
                    );
                  },
                )
              else
                LikeButton(
                  isLiked: false,
                  onTap: () {
                    artCardBloc.add(
                      LikeCard(artCard.id),
                    );
                  },
                ),
              Text(artCard.likes.length.toString(),
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(width: 210),
              Text(
                artCard.day,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Text(
          artCard.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
