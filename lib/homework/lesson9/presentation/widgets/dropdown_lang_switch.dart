import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/l10n/l10n.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

Widget dropDownButton(context, widget) {
  return DropdownButtonHideUnderline(
    child: DropdownButton2<Locale>(
      items: L10n.all.map(
        (locale) {
          final flag = L10n.getFlag(locale.languageCode);
          return DropdownMenuItem(
            value: locale,
            onTap: () {
              widget.onLanguageSwitch(locale);
            },
            child: Center(
              child: Text(
                flag,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ).toList(),
      onChanged: (_) {},
      dropdownStyleData: const DropdownStyleData(
          maxHeight: 120, width: 60, padding: EdgeInsets.all(5)),
      isExpanded: true,
      customButton: Icon(Icons.language,
          color: Theme.of(context).colorScheme.inverseSurface, size: 30),
    ),
  );
}
