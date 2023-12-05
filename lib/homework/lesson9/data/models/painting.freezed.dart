// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Painting _$PaintingFromJson(Map<String, dynamic> json) {
  return _Painting.fromJson(json);
}

/// @nodoc
mixin _$Painting {
  String get title => throw _privateConstructorUsedError;
  String get artistName => throw _privateConstructorUsedError;
  String? get yearAsString => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaintingCopyWith<Painting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaintingCopyWith<$Res> {
  factory $PaintingCopyWith(Painting value, $Res Function(Painting) then) =
      _$PaintingCopyWithImpl<$Res, Painting>;
  @useResult
  $Res call(
      {String title, String artistName, String? yearAsString, String image});
}

/// @nodoc
class _$PaintingCopyWithImpl<$Res, $Val extends Painting>
    implements $PaintingCopyWith<$Res> {
  _$PaintingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artistName = null,
    Object? yearAsString = freezed,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      yearAsString: freezed == yearAsString
          ? _value.yearAsString
          : yearAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaintingImplCopyWith<$Res>
    implements $PaintingCopyWith<$Res> {
  factory _$$PaintingImplCopyWith(
          _$PaintingImpl value, $Res Function(_$PaintingImpl) then) =
      __$$PaintingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String artistName, String? yearAsString, String image});
}

/// @nodoc
class __$$PaintingImplCopyWithImpl<$Res>
    extends _$PaintingCopyWithImpl<$Res, _$PaintingImpl>
    implements _$$PaintingImplCopyWith<$Res> {
  __$$PaintingImplCopyWithImpl(
      _$PaintingImpl _value, $Res Function(_$PaintingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? artistName = null,
    Object? yearAsString = freezed,
    Object? image = null,
  }) {
    return _then(_$PaintingImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artistName: null == artistName
          ? _value.artistName
          : artistName // ignore: cast_nullable_to_non_nullable
              as String,
      yearAsString: freezed == yearAsString
          ? _value.yearAsString
          : yearAsString // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaintingImpl with DiagnosticableTreeMixin implements _Painting {
  const _$PaintingImpl(
      {required this.title,
      required this.artistName,
      this.yearAsString = "",
      required this.image});

  factory _$PaintingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaintingImplFromJson(json);

  @override
  final String title;
  @override
  final String artistName;
  @override
  @JsonKey()
  final String? yearAsString;
  @override
  final String image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Painting(title: $title, artistName: $artistName, yearAsString: $yearAsString, image: $image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Painting'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('artistName', artistName))
      ..add(DiagnosticsProperty('yearAsString', yearAsString))
      ..add(DiagnosticsProperty('image', image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaintingImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artistName, artistName) ||
                other.artistName == artistName) &&
            (identical(other.yearAsString, yearAsString) ||
                other.yearAsString == yearAsString) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, artistName, yearAsString, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaintingImplCopyWith<_$PaintingImpl> get copyWith =>
      __$$PaintingImplCopyWithImpl<_$PaintingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaintingImplToJson(
      this,
    );
  }
}

abstract class _Painting implements Painting {
  const factory _Painting(
      {required final String title,
      required final String artistName,
      final String? yearAsString,
      required final String image}) = _$PaintingImpl;

  factory _Painting.fromJson(Map<String, dynamic> json) =
      _$PaintingImpl.fromJson;

  @override
  String get title;
  @override
  String get artistName;
  @override
  String? get yearAsString;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$PaintingImplCopyWith<_$PaintingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
