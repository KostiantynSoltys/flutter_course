part of 'paintings_bloc.dart';

@immutable
sealed class PaintingsEvent {}

class LoadPaintings extends PaintingsEvent {
  final String genre;

  LoadPaintings(this.genre);
}
