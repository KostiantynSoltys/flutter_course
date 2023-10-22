import 'package:flutter/material.dart';

Widget galleryList(currentPaintings) {
  return ListView.builder(
    itemBuilder: (BuildContext ctx, int index) {
      return Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(currentPaintings[index].link),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  currentPaintings[index].description,
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