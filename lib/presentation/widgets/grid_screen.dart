import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/blocs/liked_cards_bloc/liked_cards_bloc.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/data/models/repository.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() {
    return _GridScreenState();
  }
}

class _GridScreenState extends State<GridScreen> {
  List<ArtCard> likedCardsList = [];

  @override
  void initState() {
    BlocProvider.of<LikedCardsBloc>(context).add(
      LoadLikedCards(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LikedCardsBloc likedCardsBloc =
        BlocProvider.of<LikedCardsBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.50),
        title: const Text('Вподобане'),
        centerTitle: true,
      ),
      body: BlocBuilder<LikedCardsBloc, LikedCardsState>(
        builder: (context, state) {
          if (state is LikedCardsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LikedCardsLoaded) {
            final likedCardsList = state.likedCards;
            if (likedCardsList.isEmpty) {
              return Center(
                child: Text(
                  'На жаль, тут поки що пусто',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w500),
                ),
              );
            } else {
              return MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: likedCardsList.length,
                itemBuilder: (context, index) {
                  Future<String?> image =
                      Repository().getImage(likedCardsList[index].image);
                  return GestureDetector(
                    onTap: () => context.go("/liked_list/liked_card",
                        extra: likedCardsList[index]),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: FutureBuilder(
                        future: image,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Image.network(snapshot.data!);
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return Container();
                        },
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is LikedCardsOperationSuccess) {
            likedCardsBloc.add(
              LoadLikedCards(),
            );
            return Container();
          } else if (state is LikedCardsError) {
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
