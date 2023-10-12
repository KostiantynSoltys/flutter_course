import 'package:flutter/material.dart';
import 'package:flutter_course/homework/lesson9/data/models/painting.dart';
import 'package:flutter_course/homework/lesson9/data/paintings_list.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'fab.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'drawer.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'gallery_list.dart';
import 'package:flutter_course/homework/lesson9/presentation/widgets/'
    'gallery_grid.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  List<Painting> currentPaintings = paintingsList;
  String sectionName = 'All';

  void changeToDrawings() {
    setState(
      () {
        currentPaintings = paintingsList
            .where(
              (element) => element.genre.contains('Drawings'),
            )
            .toList();
        sectionName = 'Drawings';
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
        sectionName = 'Abstract';
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
        sectionName = 'Figurative';
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
        sectionName = 'Landscape';
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
        sectionName = 'Still Life';
      },
    );
  }

  void changeToAll() {
    setState(
      () {
        currentPaintings = paintingsList;
        sectionName = 'All';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(68, 0, 0, 0),
        elevation: 0,
        title: const Text(
          'My Gallery',
          style: TextStyle(
            color: Color.fromARGB(213, 255, 255, 255),
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(190, 255, 255, 255),
                size: 30, // Changing Drawer Icon Size
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
