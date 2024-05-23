import 'package:json_annotation/json_annotation.dart';

part 'codi_model.g.dart';

@JsonSerializable()
class CodiModel {
  String cardNumbers;
  double availableBalance;
  String expiration;
  int cvv;
  int amountData;
  String concept;

  CodiModel(
      {required this.cardNumbers,
      required this.availableBalance,
      required this.expiration,
      required this.amountData,
      required this.cvv,
      required this.concept});

  factory CodiModel.fromJson(Map<String, dynamic> json) =>
      _$CodiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodiModelToJson(this);
}
