import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rechargesimage.g.dart';

@JsonSerializable()
class RechargeImageModel {
  String imagen;

  RechargeImageModel({
    required this.imagen,
    
  });
  
  factory RechargeImageModel.fromJson(Map<String, dynamic> json) => _$RechargeImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RechargeImageModelToJson(this);
  
}
