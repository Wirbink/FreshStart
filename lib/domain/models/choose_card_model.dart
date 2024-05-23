import 'package:json_annotation/json_annotation.dart';

part 'choose_card_model.g.dart';

@JsonSerializable()
class CardModel{
  String nameCard;

  CardModel({
    required this.nameCard
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}