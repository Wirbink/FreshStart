import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fresh_start/domain/models/CoDi/codi_model.dart';
import 'package:fresh_start/domain/repositories/CoDi/codi_repository.dart';

class CodiRepositoryImpl implements CodiRepository {
  @override
  Future<CodiModel> loadCodiData() async {
    try {
      final response = await rootBundle.loadString('json_data/CoDi/codi.json');
    } on Exception catch (e) {
      print("aaaaaaaaaa $e");
    }
    final response = await rootBundle.loadString('json_data/CoDi/codi.json');
    final data = json.decode(response);
    print(data);
    return CodiModel.fromJson(data);
  }
}
