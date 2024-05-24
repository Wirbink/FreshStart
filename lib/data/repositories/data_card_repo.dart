import "dart:convert";

import "package:flutter/services.dart";
import "package:fresh_start/domain/models/data_card_model.dart";
import "package:fresh_start/domain/repositories/data_card_repo.dart";

class DataCardRepositoryImpl implements DataCardRepository {
  @override
  Future<DataCardModel> loadDataCardData() async {
    final response = await rootBundle.loadString("assets/json_data/data_card_model.json");
    final data = json.decode(response);
    return DataCardModel.dataJson(data);
  }
}