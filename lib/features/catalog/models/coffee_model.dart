import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_model.freezed.dart';
part 'coffee_model.g.dart';

@freezed
sealed class CoffeeModel with _$CoffeeModel {
  const factory CoffeeModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
  }) = _CoffeeModel;

  factory CoffeeModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeModelFromJson(json);
}
