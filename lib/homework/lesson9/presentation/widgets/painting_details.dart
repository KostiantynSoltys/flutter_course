import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/data/models/painting.dart';

class PaintingDetails extends StatelessWidget {
  const PaintingDetails({super.key, required this.painting});

  final Painting painting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.network(painting.link),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(137, 0, 0, 0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    painting.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
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
