part of 'liked_cards_bloc.dart';

@immutable
sealed class LikedCardsState {}

final class LikedCardsInitial extends LikedCardsState {}

class LikedCardsLoading extends LikedCardsState {}

class LikedCardsLoaded extends LikedCardsState {
  final List<ArtCard> likedCards;

  LikedCardsLoaded(this.likedCards);
}

class LikedCardsOperationSuccess extends LikedCardsState {
  final String message;

  LikedCardsOperationSuccess(this.message);
}

class LikedCardsError extends LikedCardsState {
  final String errorMessage;

  LikedCardsError(this.errorMessage);
}
