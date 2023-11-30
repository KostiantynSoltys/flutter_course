import 'package:bloc/bloc.dart';
import 'package:flutter_course/data/models/art_card.dart';
import 'package:flutter_course/data/models/repository.dart';
import 'package:meta/meta.dart';

part 'art_cards_event.dart';
part 'art_cards_state.dart';

class ArtCardsBloc extends Bloc<ArtCardsEvent, ArtCardsState> {
  final Repository repository;

  ArtCardsBloc({required this.repository}) : super(ArtCardsnitial()) {
    on<LoadArtCards>(
      (event, emit) async {
        try {
          emit(
            ArtCardsLoading(),
          );
          final artCards = await repository.getArtCards().first;
          emit(
            ArtCardsLoaded(artCards),
          );
        } catch (e) {
          emit(
            ArtCardsError(
              e.toString(),
            ),
          );
        }
      },
    );

    on<LikeCard>(
      (event, emit) async {
        emit(ArtCardsLoading());
        try {
          await repository.likeCard(id: event.title);
          emit(ArtCardsOperationSuccess('Art Card liked successfully'));
        } catch (e) {
          emit(
            ArtCardsError(
              e.toString(),
            ),
          );
        }
      },
    );

    on<UnlikeCard>(
      (event, emit) async {
        emit(ArtCardsLoading());
        try {
          await repository.unlikeCard(id: event.title);
          emit(ArtCardsOperationSuccess('Art Card unliked successfully'));
        } catch (e) {
          emit(
            ArtCardsError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
