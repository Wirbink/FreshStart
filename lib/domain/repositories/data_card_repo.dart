import "package:fresh_start/domain/models/data_card_model.dart";

abstract class DataCardRepository{
  Future<DataCardModel> loadDataCardData();
}