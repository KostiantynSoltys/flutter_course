part of 'liked_cards_bloc.dart';

@immutable
sealed class LikedCardsEvent {}

class LoadLikedCards extends LikedCardsEvent {}
