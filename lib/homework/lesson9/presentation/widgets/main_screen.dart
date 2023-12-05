import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/homework/lesson9/bloc/paintings_bloc.dart';
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

  String? sectionName;
  String artist = 'alfred-kubin';

  @override
  void initState() {
    BlocProvider.of<PaintingsBloc>(context)
        .add(LoadPaintings(artist));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PaintingsBloc paintingsBloc = BlocProvider.of<PaintingsBloc>(context);
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
        child:
            drawer(context, paintingsBloc, artist
                ),
      ),
      body: BlocBuilder<PaintingsBloc, PaintingsState>(
        builder: (context, state) {
          if (state is PaintingsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PaintingsLoaded) {
            final paintingsList = state.paintings;
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return galleryList(paintingsList);
                } else {
                  return galleryGrid(paintingsList, context, artist, paintingsBloc);
                }
              },
            );
          } else if (state is PaintingsOperationSuccess) {
            paintingsBloc.add(
              LoadPaintings(artist),
            );
            return Container();
          } else if (state is PaintingsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(state.errorMessage),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}