import 'package:freezed_annotation/freezed_annotation.dart';

part 'cake.freezed.dart';
part 'cake.g.dart';

/// Represents a class for [Cake] model.
@freezed
class Cake with _$Cake {
  /// Provides a constuctor for [Cake].
  //const Cake._();

  /// Provides a factory for [Cake] instance.
  const factory Cake({
    @Default(-1) int id,
    required String name,
    required int yummyness,
  }) = _Cake;

  factory Cake.fromJson(Map<String, dynamic> json) => _$CakeFromJson(json);
}
