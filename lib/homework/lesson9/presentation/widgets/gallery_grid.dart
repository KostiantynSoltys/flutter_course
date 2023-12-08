import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/bloc/paintings_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'painting_details.dart';

Widget galleryGrid(currentPaintings, context, artist, paintingsBloc) {
  return RefreshIndicator(
    onRefresh: () => paintingsBloc.add(
      LoadPaintings(artist),
    ),
    child: MasonryGridView.builder(
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: currentPaintings.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PaintingDetails(painting: currentPaintings[index]),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.network(currentPaintings[index]
                .image
                .toString()
                .replaceAll('!Large.jpg', '')),
          ),
        );
      },
    ),
  );
}
