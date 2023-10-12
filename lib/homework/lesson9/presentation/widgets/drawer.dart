import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'contacts.dart';

Widget drawer(context, changeToAll, changeToAbstract, changeToDrawings,
    changeToFigurative, changeToLandscape, changeToStillLife) {
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          padding: EdgeInsets.only(top: 60),
          decoration: BoxDecoration(
            color: Color.fromARGB(158, 0, 0, 0),
          ),
          child: Text('Genres',
              style: TextStyle(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center),
        ),
        ListTile(
          title: const Text('All', textAlign: TextAlign.center),
          onTap: () {
            changeToAll();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Abstract', textAlign: TextAlign.center),
          onTap: () {
            changeToAbstract();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Drawings', textAlign: TextAlign.center),
          onTap: () {
            changeToDrawings();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Figurative', textAlign: TextAlign.center),
          onTap: () {
            changeToFigurative();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Landscape', textAlign: TextAlign.center),
          onTap: () {
            changeToLandscape();
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Still Life', textAlign: TextAlign.center),
          onTap: () {
            changeToStillLife();
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const Text('Contacts', textAlign: TextAlign.center),
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
