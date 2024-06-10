import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/Temp/card_model.dart';
import 'package:fresh_start/domain/repositories/Temp/card_repository.dart';

class CardRepositoryImpl implements CardRepository{
  @override
  Future<CardModel> loadCardData() async {
  final response = await rootBundle.loadString("assets/json_data/user.json");
  final data = json.decode(response);
  print(data);
  return CardModel.fromJson(data);
  }
}