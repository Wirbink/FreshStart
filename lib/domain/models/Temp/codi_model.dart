import 'package:json_annotation/json_annotation.dart';

part 'codi_model.g.dart';

@JsonSerializable()
class CodiModel{
  int id;
  double amount;
  String concept;
  int cardId;
  String qr;

  CodiModel({
    required this.id,
    required this.amount,
    required this.concept,
    required this.cardId,
    required this.qr
  });

  factory CodiModel.fromJson(Map<String, dynamic> json) =>
      _$CodiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodiModelToJson(this);
}