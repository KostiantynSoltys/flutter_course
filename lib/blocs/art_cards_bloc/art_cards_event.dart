part of 'art_cards_bloc.dart';

@immutable
sealed class ArtCardsEvent {}

class LoadArtCards extends ArtCardsEvent {}

class LikeCard extends ArtCardsEvent {
  final String title;

  LikeCard(this.title);
}

class UnlikeCard extends ArtCardsEvent {
  final String title;

  UnlikeCard(this.title);
}
