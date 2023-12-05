part of 'paintings_bloc.dart';

@immutable
sealed class PaintingsState {}

final class PaintingsInitial extends PaintingsState {}

class PaintingsLoading extends PaintingsState {}

class PaintingsLoaded extends PaintingsState {
  final List<Painting> paintings;

  PaintingsLoaded(this.paintings);
}

class PaintingsOperationSuccess extends PaintingsState {
  final String message;

  PaintingsOperationSuccess(this.message);
}

class PaintingsError extends PaintingsState {
  final String errorMessage;

  PaintingsError(this.errorMessage);
}
