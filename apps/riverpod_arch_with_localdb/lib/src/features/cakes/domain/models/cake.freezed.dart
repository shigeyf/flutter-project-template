// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cake _$CakeFromJson(Map<String, dynamic> json) {
  return _Cake.fromJson(json);
}

/// @nodoc
mixin _$Cake {
//@Default(-1) int id,
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get yummyness => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CakeCopyWith<Cake> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CakeCopyWith<$Res> {
  factory $CakeCopyWith(Cake value, $Res Function(Cake) then) =
      _$CakeCopyWithImpl<$Res, Cake>;
  @useResult
  $Res call({String id, String name, int yummyness, DateTime createdAt});
}

/// @nodoc
class _$CakeCopyWithImpl<$Res, $Val extends Cake>
    implements $CakeCopyWith<$Res> {
  _$CakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? yummyness = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      yummyness: null == yummyness
          ? _value.yummyness
          : yummyness // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CakeImplCopyWith<$Res> implements $CakeCopyWith<$Res> {
  factory _$$CakeImplCopyWith(
          _$CakeImpl value, $Res Function(_$CakeImpl) then) =
      __$$CakeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int yummyness, DateTime createdAt});
}

/// @nodoc
class __$$CakeImplCopyWithImpl<$Res>
    extends _$CakeCopyWithImpl<$Res, _$CakeImpl>
    implements _$$CakeImplCopyWith<$Res> {
  __$$CakeImplCopyWithImpl(_$CakeImpl _value, $Res Function(_$CakeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? yummyness = null,
    Object? createdAt = null,
  }) {
    return _then(_$CakeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      yummyness: null == yummyness
          ? _value.yummyness
          : yummyness // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CakeImpl extends _Cake {
  const _$CakeImpl(
      {required this.id,
      required this.name,
      required this.yummyness,
      required this.createdAt})
      : super._();

  factory _$CakeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CakeImplFromJson(json);

//@Default(-1) int id,
  @override
  final String id;
  @override
  final String name;
  @override
  final int yummyness;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Cake(id: $id, name: $name, yummyness: $yummyness, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CakeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.yummyness, yummyness) ||
                other.yummyness == yummyness) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, yummyness, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CakeImplCopyWith<_$CakeImpl> get copyWith =>
      __$$CakeImplCopyWithImpl<_$CakeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CakeImplToJson(
      this,
    );
  }
}

abstract class _Cake extends Cake {
  const factory _Cake(
      {required final String id,
      required final String name,
      required final int yummyness,
      required final DateTime createdAt}) = _$CakeImpl;
  const _Cake._() : super._();

  factory _Cake.fromJson(Map<String, dynamic> json) = _$CakeImpl.fromJson;

  @override //@Default(-1) int id,
  String get id;
  @override
  String get name;
  @override
  int get yummyness;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CakeImplCopyWith<_$CakeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
