import 'package:fresh_start/domain/models/Temp/card_model.dart';

abstract class CardRepository{
  Future<CardModel> loadCardData();
}