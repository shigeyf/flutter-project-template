import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../../../../app/utils/fast_hash.dart';

part 'cake.freezed.dart';
part 'cake.g.dart';

/// Represents a class for [Cake] model.
@freezed
@Collection(ignore: {'copyWith'})
class Cake with _$Cake {
  /// Provides a constuctor for [Cake].
  const Cake._();

  /// Provides a factory for [Cake] instance.
  const factory Cake({
    required String id,
    required DateTime createdAt,
    required String name,
    required int yummyness,
  }) = _Cake;

  Id get keyId => fastHash(id);

  factory Cake.fromJson(Map<String, dynamic> json) => _$CakeFromJson(json);

  factory Cake._builder(CakeBuilder builder) {
    return Cake(
      id: builder.id,
      name: builder.name,
      yummyness: builder.yummyness,
      createdAt: builder.createdAt
    );
  }
}

class CakeBuilder {
  static const Uuid _uuid = Uuid();

  final String id;
  final DateTime createdAt;
  final String name;
  int yummyness = 0;

  CakeBuilder({required this.name, this.yummyness = 0})
      : id = _uuid.v1(),
        createdAt = DateTime.now();

  Cake build() {
    return Cake._builder(this);
  }
}
