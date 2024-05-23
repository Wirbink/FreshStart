import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rechargesimage.g.dart';
@JsonSerializable()
class RechargeImageModel {
  Image imagen;

  RechargeImageModel({
    required this.imagen,
    
  });
  
  Factory RechargeImageModel.fromJson(Map<String, dynamic> json) => _$RechargeImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$RechargeImageModelFromJson(this);
  
}
