import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/bloc/paintings_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'contacts.dart';

Widget drawer(context, paintingsBloc, artist) {
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
            artist = 'emil-nolde';
            paintingsBloc.add(LoadPaintings(artist));
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.abstract,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            artist = 'otto-dix';
            paintingsBloc.add(LoadPaintings(artist));
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.drawings,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            artist = 'otto-mueller';
            paintingsBloc.add(LoadPaintings(artist));
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.figurative,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            artist = 'max-pechstein';
            paintingsBloc.add(LoadPaintings(artist));
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.landscape,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            artist = 'erich-heckel';
            paintingsBloc.add(LoadPaintings(artist));
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text(AppLocalizations.of(context)!.stillLife,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
          onTap: () {
            artist = 'karl-schmidt-rottluff';
            paintingsBloc.add(LoadPaintings(artist));
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
