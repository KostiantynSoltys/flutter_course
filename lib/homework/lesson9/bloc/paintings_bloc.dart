import 'package:bloc/bloc.dart';
import 'package:flutter_course/homework/lesson9/data/models/painting.dart';
import 'package:flutter_course/homework/lesson9/data/network_client.dart.dart';
import 'package:meta/meta.dart';

part 'paintings_event.dart';
part 'paintings_state.dart';

class PaintingsBloc extends Bloc<PaintingsEvent, PaintingsState> {
  final NetworkCLient networkCLient;

  PaintingsBloc({required this.networkCLient}) : super(PaintingsInitial()) {
    on<LoadPaintings>(
      (event, emit) async {
        try {
          emit(
            PaintingsLoading(),
          );
          final paintings = await networkCLient.getPaintings(event.genre);
          emit(
            PaintingsLoaded(paintings),
          );
        } catch (e) {
          emit(
            PaintingsError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
