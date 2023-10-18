import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'contacts.dart';

Widget drawer(context, changeToAll, changeToAbstract, changeToDrawings,
    changeToFigurative, changeToLandscape, changeToStillLife) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Text(AppLocalizations.of(context)!.genres,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center),
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.all,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            changeToAll();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.abstract,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            changeToAbstract();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.drawings,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            changeToDrawings();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.figurative,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            changeToFigurative();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.landscape,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            changeToLandscape();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.stillLife,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            changeToStillLife();
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(height: 20),
        ListTile(
          title: Text(AppLocalizations.of(context)!.contacts,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Contacts(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
