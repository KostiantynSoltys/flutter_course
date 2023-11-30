import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/data/models/repository.dart';

part 'liked_cards_event.dart';
part 'liked_cards_state.dart';

class LikedCardsBloc extends Bloc<LikedCardsEvent, LikedCardsState> {
  final Repository repository;

  LikedCardsBloc({required this.repository}) : super(LikedCardsInitial()) {
    on<LoadLikedCards>(
      (event, emit) async {
        try {
          emit(
            LikedCardsLoading(),
          );
          final likedCards = await repository.getLikedList().first;
          emit(
            LikedCardsLoaded(likedCards),
          );
        } catch (e) {
          emit(
            LikedCardsError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
