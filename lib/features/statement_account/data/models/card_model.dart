import 'package:fresh_start/features/statement_account/domain/entities/card_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel extends CardEntity {
  CardModel(
      {required int id,
      required int id_account,
      required String card,
      required String card_account,
      required int status})
      : super(
            id: id,
            id_account: id_account,
            card: card,
            card_account: card_account,
            status: status);

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
