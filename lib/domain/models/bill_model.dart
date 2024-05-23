import 'package:json_annotation/json_annotation.dart';

part 'bill_model.g.dart';

@JsonSerializable()
class BillModel {
  String billData;
  String voucher;
  String youPaidWith;

  BillModel ({
    required this.billData,
    required this.voucher,
    required this.youPaidWith
  });

  factory BillModel.fromJson(Map<String, dynamic> json) => _$BillModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillModelToJson(this);
}