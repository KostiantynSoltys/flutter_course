import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/data/models/painting.dart';

class PaintingDetails extends StatelessWidget {
  const PaintingDetails({super.key, required this.painting});

  final Painting painting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.network(painting.image),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onInverseSurface
                      .withOpacity(0.50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${painting.title} (${painting.yearAsString})',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
