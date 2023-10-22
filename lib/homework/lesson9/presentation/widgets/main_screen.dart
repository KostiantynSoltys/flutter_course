import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/data/models/painting.dart';
import 'package:flutter_course/homework/lesson9/data/paintings_list.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'theme_switch_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'fab_info.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'drawer.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'gallery_list.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'gallery_grid.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'dropdown_lang_switch.dart';

class MainScreen extends StatefulWidget {
  const MainScreen(
      {super.key,
      required this.onLanguageSwitch,
      required this.onThemeModeSwitch});

  final void Function(Locale locale) onLanguageSwitch;
  final Function onThemeModeSwitch;

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Painting> currentPaintings = paintingsList;
  String? sectionName;

  void changeToDrawings() {
    setState(
      () {
        currentPaintings = paintingsList
            .where(
              (element) => element.genre.contains('Drawings'),
            )
            .toList();
        sectionName = AppLocalizations.of(context)!.drawings;
      },
    );
  }

  void changeToAbstract() {
    setState(
      () {
        currentPaintings = paintingsList
            .where(
              (element) => element.genre.contains('Abstract'),
            )
            .toList();
        sectionName = AppLocalizations.of(context)!.abstract;
      },
    );
  }

  void changeToFigurative() {
    setState(
      () {
        currentPaintings = paintingsList
            .where(
              (element) => element.genre.contains('Figurative'),
            )
            .toList();
        sectionName = AppLocalizations.of(context)!.figurative;
      },
    );
  }

  void changeToLandscape() {
    setState(
      () {
        currentPaintings = paintingsList
            .where(
              (element) => element.genre.contains('Landscape'),
            )
            .toList();
        sectionName = AppLocalizations.of(context)!.landscape;
      },
    );
  }

  void changeToStillLife() {
    setState(
      () {
        currentPaintings = paintingsList
            .where(
              (element) => element.genre.contains('Still Life'),
            )
            .toList();
        sectionName = AppLocalizations.of(context)!.stillLife;
      },
    );
  }

  void changeToAll() {
    setState(
      () {
        currentPaintings = paintingsList;
        sectionName = AppLocalizations.of(context)!.all;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.50),
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.myGallery,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).colorScheme.inverseSurface,
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          themeSwitch(context, widget),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: dropDownButton(context, widget),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(context, sectionName),
      drawer: SizedBox(
        width: 170,
        child: drawer(context, changeToAll, changeToAbstract, changeToDrawings,
            changeToFigurative, changeToLandscape, changeToStillLife),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return galleryList(currentPaintings);
          } else {
            return galleryGrid(currentPaintings);
          }
        },
      ),
    );
  }
}
