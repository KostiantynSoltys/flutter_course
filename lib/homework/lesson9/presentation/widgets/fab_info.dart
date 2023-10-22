import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'section_info.dart';

Widget floatingActionButton(context, sectionName) {
  return FloatingActionButton(
    shape: const CircleBorder(eccentricity: BorderSide.strokeAlignCenter),
    backgroundColor:
        Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(0.50),
    foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
    child: const Icon(Icons.question_mark_rounded, size: 40),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SectionInfo(
              sectionName: sectionName ?? AppLocalizations.of(context)!.all),
        ),
      );
    },
  );
}
