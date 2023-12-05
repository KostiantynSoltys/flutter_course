import 'package:flutter/material.dart';

Widget galleryList(currentPaintings) {
  return ListView.builder(
    itemBuilder: (BuildContext ctx, int index) {
      return Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(
                currentPaintings[index]
                    .image
                    .toString()
                    .replaceAll('!Large.jpg', ''),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${currentPaintings[index].title} '
                  '(${currentPaintings[index].yearAsString})',
                  style: Theme.of(ctx).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    },
    itemCount: currentPaintings.length,
  );
}
