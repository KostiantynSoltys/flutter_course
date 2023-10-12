import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'section_info.dart';

Widget floatingActionButton(context, sectionName) {
  return FloatingActionButton(
    shape: const CircleBorder(eccentricity: BorderSide.strokeAlignCenter),
    backgroundColor: const Color.fromARGB(161, 255, 255, 255),
    child: const Icon(Icons.question_mark_rounded, size: 40),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SectionInfo(sectionName: sectionName),
        ),
      );
    },
  );
}
