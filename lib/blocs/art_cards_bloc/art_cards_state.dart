part of 'art_cards_bloc.dart';

@immutable
sealed class ArtCardsState {}

class ArtCardsnitial extends ArtCardsState {}

class ArtCardsLoading extends ArtCardsState {}

class ArtCardsLoaded extends ArtCardsState {
  final List<ArtCard> artCards;

  ArtCardsLoaded(this.artCards);
}

class ArtCardsOperationSuccess extends ArtCardsState {
  final String message;

  ArtCardsOperationSuccess(this.message);
}

class ArtCardsError extends ArtCardsState {
  final String errorMessage;

  ArtCardsError(this.errorMessage);
}
